@echo off
@echo This command file must be run within an Integration Bus Command Console.

SET MQCHLTAB=IIBCLCHL.TAB
SET MQCHLLIB=C:\student10\MQ_SSL\CCDT
SET portP=""

@echo Now for CONSUMER node 
echo off

REM *****  Create https listener and SSL Truststore config for Web Admin on %nodeC% ******
call runmqsc -n 

@echo -
REM ****************************************************************
REM ********  PART 8 - Restart nodes for changes to take effect. ***
REM ****************************************************************
REM ** Start provider first so that its likely to get 7800 port 
@Echo Restart nodes to make WebUI changes effective .... 
@echo Stopping IIB Node %nodeC%
mqsistop %nodeC%
@echo Stopping IIB Node %nodeP%
mqsistop %nodeP%
@echo Starting IIB Node %nodeP%
mqsistart %nodeP%
@echo Starting IIB Node %nodeC%
mqsistart %nodeC%

REM DONE: ready to Run 1SETUPPKI