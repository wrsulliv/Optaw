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
Run summary for (p551):
clang:    PASS
llc:      PASS
g++:      PASS
run:      FAIL *** TIMEOUT OCCURED
```


## Parameters:  

You can change the timeout and other user defined variables at the top of (complez.py).  Note that the default timeout is 10 seconds.  




