# Complez.py

#### Compile and run all (.c) files in (src) and test each file for success / failure.



## Usage:

* Clone this repo to a directory on an eecs583 machine
* Put your fixed source code files in (src)
* Using the terminal, navigate to the directory which contains "complez.py"
* type "python complez.py"

The terminal will show output which looks like this:

```
Run summary for (p551):
clang:    PASS
llc:      PASS
g++:      PASS
run:      FAIL ***
```

If the failure occured from a timeout then it will appear as:

```
Run summary for (p550):
clang:    PASS
llc:      PASS
g++:      PASS
run:      FAIL *** TIMEOUT OCCURED
```

The output files for each evaluation are stored in (./output/stdout) and (./output/stderr).  This includes the standard output and standard error of each file, respectively.  

More importantly, a CSV file (results.csv) is created in (./output).  This CSV file has the following format:

```
[benchmark_name, clang_success, clang_timeout_occured, llc_success, llc_timeout_occured, g++_success, g++_timeout_occured, run_success, run_timeout_occured]
```

## Parameters:  

You can change the timeout and other user defined variables at the top of (complez.py).  Note that the default timeout is 10 seconds.  




