@echo off
@echo This command file must be run within an Integration Bus Command Console.

REM Following required for runmqsc -n command :-
SET MQCHLTAB=IIBCLCHL.TAB
SET MQCHLLIB=C:\student10\MQ_SSL\CCDT

SET nodeP=""
SET servP=""
SET nodeC=""
SET servC=""
SET AddClnt=""

REM *****************************************************
REM ********  PART 1 - CREATE QMGR and NODE  ************
REM *****************************************************
echo Betaworks MQ SSL Security Lab guide MQ Client Channel definition setup.

SET /P nodeP=Enter PROVIDER IIB Node name (default is IB10NODE_PMQ): %=%
If %nodeP%=="" set nodeP="IB10NODE_PMQ"



SET /P nodeC=Enter CONSUMER IIB Node name (default is IB10NODE_CMQ): %=%
If %nodeC%=="" set nodeC="IB10NODE_CMQ"



SET /P AddClnt=Add IIBCLNT.TO.QM4SSL in CCDT %MQCHLTAB% ? (n): %=%
If %AddClnt%=="" set AddClnt=n
@echo Thankyou, using values %nodeP%,  %nodeC%,  Add Clnt=%AddClnt%
@echo Ok to proceed? Use Ctrl-C to terminate.
PAUSE

If %AddClnt%==y call runmqsc -n < SET_IIBCLNTCONN.mqsc

If %AddClnt%==n call runmqsc -n < DEL_IIBCLNTCONN.mqsc
echo off

REM *****  Create https listener and SSL Truststore config for Web Admin on %nodeC% ******



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