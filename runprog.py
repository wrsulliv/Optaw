
# User defined variables
SRC_DIR = './src'
ASM_DIR = './output/asm'
BIN_DIR = './output/bin'
STDERR_DIR = './output/stderr'
STDOUT_DIR = './output/stdout'
TIMEOUT = 5

# Program start
import os  
import subprocess
import threading


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
        return (self.process.returncode, timeout)

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
		if (clang_timeout):
			result_str = name + ' ' * spaces_needed + 'FAIL *** TIMEOUT OCCURED'

		else:
			result_str = name + ' ' * spaces_needed + 'FAIL ***'

	print(result_str);

for fn in os.listdir(SRC_DIR):
	# Create variables for the current file
	file_name = os.path.splitext(fn)[0]
	path_to_src = SRC_DIR + '/' + fn
	path_to_bc = ASM_DIR + '/' + file_name + '.bc'
	path_to_s = ASM_DIR + '/' + file_name + '.s'
	path_to_exe = BIN_DIR + '/' + file_name + '.exe'
	path_to_stderr = STDERR_DIR + '/' + file_name + '.stderr'
	path_to_stdout = STDOUT_DIR + '/' + file_name + '.stdout'

	if os.path.isfile(path_to_src):
		clang_command = Command('clang -emit-llvm -o ' + path_to_bc + ' -c ' + path_to_src + ' 2> ' + path_to_stderr + '.clang > ' + path_to_stdout + '.clang')
		llc_command = Command('llc < ' + path_to_bc + ' > ' + path_to_s + ' 2> ' + path_to_stderr + '.llc')
		gpp_command = Command('g++ -o ' + path_to_exe + ' ' + path_to_s + ' 2> ' + path_to_stderr + '.gpp')
		run_command = Command(path_to_exe + ' 2> ' + path_to_stderr + '.run > ' + path_to_stdout + '.run')

		(clang_failure, clang_timeout) = clang_command.run(TIMEOUT);
		(llc_failure, llc_timeout) = llc_command.run(TIMEOUT);
		(gpp_failure, gpp_timeout) = gpp_command.run(TIMEOUT);
		(run_failure, run_timeout) = run_command.run(TIMEOUT);

		# Print the results
		print("Run summary for (" + file_name + "):")
		printResults('clang', clang_failure, clang_timeout);
		printResults('llc', llc_failure, llc_timeout);
		printResults('g++', gpp_failure, gpp_timeout);
		printResults('run', run_failure, run_timeout);





