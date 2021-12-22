@echo off
echo This command file must be run within an Integration Bus Command Console.

SET node1=""
SET server1=""

REM ***************************************
REM ******** PROMPT FOR NODE, SERVER ******
REM ***************************************

SET /P node1=Enter IIB Node name (default is IB10NODE): %=%
If %node1%=="" set node1="IB10NODE"

SET /P server1=Enter IIB Server name (default is server1): %=%
If %server1%=="" set server1="server1"

REM echo Thankyou, using values %node1%, %server1%. Ok to proceed? Use Ctrl-C to terminate.
REM PAUSE

REM *****************************************************
REM ******** REPORT AUTH. PROTOCOL ON CONSUMER  *********
REM *****************************************************

mqsireportproperties %node1% -e %server1% -o ComIbmSocketConnectionManager -n allowedAuthTypes

PAUSE



