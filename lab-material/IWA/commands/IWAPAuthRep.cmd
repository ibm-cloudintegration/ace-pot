@echo off
echo This command file must be run within an Integration Bus Command Console.

SET node1=""
SET server1=""

REM *****************************************
REM ******** PROMPT FOR NODE, SERVER,  ******
REM *****************************************

SET /P node1=Enter IIB Node name (default is TESTNODE_IIBADMIN): %=%
If %node1%=="" set node1="TESTNODE_IIBADMIN"

SET /P server1=Enter IIB server name (default is default): %=%
If %server1%=="" set server1="default"

REM echo Thankyou, using values %node1%, %server1%. Ok to proceed? Use Ctrl-C to terminate.
REM PAUSE

REM ************************************************
REM ******** Report IWA Auth. ON PROVIDER  *********
REM ************************************************

mqsireportproperties %node1% -e %server1% -o HTTPConnector -n integratedWindowsAuthentication

PAUSE