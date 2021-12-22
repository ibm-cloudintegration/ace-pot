@echo off
echo This command file must be run within an Integration Bus Command Console.

SET node1=""

REM *****************************************************
REM ******** PROMPT FOR NODE                       ******
REM *****************************************************

SET /P node1=Enter IIB Node name (default is TESTNODE_IIBADMIN): %=%
If %node1%=="" set node1="TESTNODE_IIBADMIN"

echo Thankyou, using value %node1%. Ok to proceed? Use Ctrl-C to terminate.
PAUSE

REM *****************************************************
REM ******** USE BROKER LISTENER                *********
REM *****************************************************

mqsichangeproperties %node1% -b httplistener -o HTTPListener -n startListener -v false

echo Stopping node %node1%
mqsistop %node1%

echo Starting node %node1%
mqsistart %node1%

echo Node %node1% must be fully started to proceed to the next stage. Please check progress then click Return to proceed. Use Ctrl-C to terminate.
PAUSE


