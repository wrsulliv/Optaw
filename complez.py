
# Author: Will Sullivan
# EECS 583 - Complez 

# User defined variables
TIMEOUT = 10 # Set the timeout in seconds

# Set input and output directories
SRC_DIR = './src'
ASM_DIR = './output/asm'
BIN_DIR = './output/bin'
STDERR_DIR = './output/stderr'
STDOUT_DIR = './output/stdout'
OUTPUT_CSV = './output/results.csv'

# Set the output file route paths
COMPILE_FAIL_DIR = './output/categorized_src/failed_at_compile'
RUN_FAIL_DIR = './output/categorized_src/failed_at_run'
TIMEOUT_DIR = './output/categorized_src/failed_at_run/timeout'
SUCCESS_DIR = './output/categorized_src/success'

# Program start
import os  
import subprocess
import threading

# Create a dictionary to hold all the results
results_file_handle = open(OUTPUT_CSV,'w')

# Commnand Class:  Used to set a timeout for and execute a shell command.  
# I found this "Command" class here:  http://stackoverflow.com/questions/1191374/using-module-subprocess-with-timeout
class Command(object):
    def __init__(self, cmd):
        self.cmd = cmd
        self.process = None

    def run(self, timeout):
        def target():
            self.process = subprocess.Popen(self.cmd, shell=True)
            self.process.communicate()

        thread = threading.Thread(target=target)
        thread.start()

        thread.join(timeout)
        timeout = False;
        if thread.is_alive():
            self.process.terminate()
            thread.join()
            timeout = True;
        return ((self.process.returncode != 0), timeout)

# Writes the results to the terminal
def printResults(name, failure, timeout):
	name = name + ':';
	chars_in_column = 10;
	name_len = len(name);
	spaces_needed = chars_in_column - name_len;
	result_str = "";
	if (not failure):
		result_str = name + ' ' * spaces_needed + 'PASS'
	else:
		if (timeout):
			result_str = name + ' ' * spaces_needed + 'FAIL *** TIMEOUT OCCURED'

		else:
			result_str = name + ' ' * spaces_needed + 'FAIL ***'
	print(result_str);

# Route the file to the correct output folder
def routeFile(file_path, full_file_name, compile_failure, run_failure, run_timeout_occured):
	if (compile_failure):
		os.system('cp ' + file_path + ' ' + COMPILE_FAIL_DIR + '/' + full_file_name)
	elif (run_failure):
		if (run_timeout_occured):
			os.system('cp ' + file_path + ' ' + TIMEOUT_DIR + '/' + full_file_name)
		else:
			os.system('cp ' + file_path + ' ' + RUN_FAIL_DIR + '/' + full_file_name)
	else:
		os.system('cp ' + file_path + ' ' + SUCCESS_DIR + '/' + full_file_name)


for full_file_name in os.listdir(SRC_DIR):
	if not full_file_name.startswith('.'):
		# Create variables for the current file
		file_name = os.path.splitext(full_file_name)[0]
		path_to_src = SRC_DIR + '/' + full_file_name
		path_to_bc = ASM_DIR + '/' + file_name + '.bc'
		path_to_s = ASM_DIR + '/' + file_name + '.s'
		path_to_exe = BIN_DIR + '/' + file_name + '.exe'
		path_to_stderr = STDERR_DIR + '/' + file_name + '.stderr'
		path_to_stdout = STDOUT_DIR + '/' + file_name + '.stdout'

		if os.path.isfile(path_to_src):

			# Construct the commands
			clang_command = Command('clang -emit-llvm -o ' + path_to_bc + ' -c ' + path_to_src + ' 2> ' + path_to_stderr + '.clang > ' + path_to_stdout + '.clang')
			llc_command = Command('llc < ' + path_to_bc + ' > ' + path_to_s + ' 2> ' + path_to_stderr + '.llc')
			gpp_command = Command('g++ -o ' + path_to_exe + ' ' + path_to_s + ' 2> ' + path_to_stderr + '.gpp')
			run_command = Command(path_to_exe + ' 2> ' + path_to_stderr + '.run > ' + path_to_stdout + '.run')

			# Run the commands
			(clang_failure, clang_timeout) = clang_command.run(TIMEOUT)
			(llc_failure, llc_timeout) = llc_command.run(TIMEOUT)
			(gpp_failure, gpp_timeout) = gpp_command.run(TIMEOUT)
			(run_failure, run_timeout) = run_command.run(TIMEOUT)

			# Route the files to the correct category folders
			compile_failure = False;
			if (clang_failure or llc_failure or gpp_failure):
				compile_failure = True;
			routeFile(path_to_src, full_file_name, compile_failure, run_failure, run_timeout)

			# Print the results to STDOUT
			print("Run summary for (" + file_name + "):")
			printResults('clang', clang_failure, clang_timeout)
			printResults('llc', llc_failure, llc_timeout)
			printResults('g++', gpp_failure, gpp_timeout)
			printResults('run', run_failure, run_timeout)

			# Write to the result (.csv) file
			results_string = file_name + ',' + str(int(clang_failure)) + ',' + str(int(clang_timeout)) + ',' + str(int(llc_failure)) + ',' + str(int(llc_timeout)) + ',' + str(int(gpp_failure)) + ',' + str(int(gpp_timeout)) + ',' + str(int(run_failure)) + ',' + str(int(run_timeout))
			results_file_handle.write(results_string + '\n')

results_file_handle.close()

