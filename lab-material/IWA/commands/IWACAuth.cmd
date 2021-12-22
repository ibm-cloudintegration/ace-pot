@echo off
echo This command file must be run within an Integration Bus Command Console.

SET node1=""
SET server1=""
SET iwa1=""

REM *****************************************************
REM ******** PROMPT FOR NODE, SERVER, IWA PROTOCOL ******
REM *****************************************************

SET /P node1=Enter IIB Node name (default is IB10NODE): %=%
If %node1%=="" set node1="IB10NODE"

SET /P server1=Enter IIB Server name (default is server1): %=%
If %server1%=="" set server1="server1"

SET /P iwa1=Enter IWA protocol (1 of: 1 for IWA, 2 for NTLM, 3 for Negotiate, 4 for Nego2, 5 for Basic, 6 for All, 7 for None (Default)): %=%
If %iwa1%=="" set iwa1=7
If %iwa1%==1 set iwa1="IWA"
If %iwa1%==2 set iwa1="NTLM"
If %iwa1%==3 set iwa1="Negotiate"
If %iwa1%==4 set iwa1="Nego2"
If %iwa1%==5 set iwa1="Basic"
If %iwa1%==6 set iwa1="All"
If %iwa1%==7 set iwa1="None"

echo Thankyou, using values %node1%, %server1%, %iwa1%. Ok to proceed? Use Ctrl-C to terminate.
PAUSE

REM *****************************************************
REM ******** ENABLE AUTH. PROTOCOL ON CONSUMER  *********
REM *****************************************************

mqsichangeproperties %node1% -e %server1% -o ComIbmSocketConnectionManager -n allowedAuthTypes -v %iwa1%

echo Stopping node %node1%
mqsistop %node1%

echo Starting node %node1%
mqsistart %node1%

echo Node %node1% must be fully started to proceed to the next stage. Please check progress then click Return to proceed. Use Ctrl-C to terminate.
PAUSE


