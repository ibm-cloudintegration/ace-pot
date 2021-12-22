@echo off
echo This command file must be run within an Integration Bus Command Console.

SET node1=""
SET server1=""
SET iwa1=""

REM *****************************************************
REM ******** PROMPT FOR NODE, SERVER, IWA PROTOCOL ******
REM *****************************************************

SET /P node1=Enter IIB Node name (default is TESTNODE_IIBADMIN): %=%
If %node1%=="" set node1="TESTNODE_IIBADMIN"

SET /P server1=Enter IIB server name (default is default): %=%
If %server1%=="" set server1="default"

SET /P iwa1=Enter IWA protocol (1 of: 1 for NTLM, 2 for Negotiate, 3 for Negotiate-Kerberos, blank (Default)): %=%
If %iwa1%==1 set iwa1="NTLM"
If %iwa1%==2 set iwa1="Negotiate"
If %iwa1%==3 set iwa1="Negotiate-Kerberos"

echo Thankyou, using values %node1%, %server1%, %iwa1%. Ok to proceed? Use Ctrl-C to terminate.
PAUSE

REM *****************************************************
REM ******** ENABLE AUTH. PROTOCOL ON PROVIDER  *********
REM *****************************************************

mqsichangeproperties %node1% -e %server1% -o HTTPConnector -n integratedWindowsAuthentication -v %iwa1%

echo Stopping node %node1%
mqsistop %node1%

echo Starting node %node1%
mqsistart %node1%

echo Node %node1% must be fully started to proceed to the next stage. Please check progress then click Return to proceed. Use Ctrl-C to terminate.
PAUSE


