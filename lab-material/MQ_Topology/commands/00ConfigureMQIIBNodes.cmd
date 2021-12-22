@echo off
@echo This command file must be run within an Integration Bus Command Console.

SET nodeP=""
SET servP=""
SET portP=""

SET nodeC=""
SET servC=""
SET portC=""

REM *****************************************************************
REM ********  PART 1 - Obtain details for PROVIDER NODE  ************
REM *****************************************************************

SET /P nodeP=Enter IIB Node name (default is IB10NODE_PMQ): %=%
If %nodeP%=="" set nodeP=IB10NODE_PMQ

SET /P portP=Enter port for %nodeP% web admin https listener (default is 4426): %=%
If %portP%=="" set portP=4426

SET /P serv1=Enter server name for %nodeP% (default is MQPROVIDER): %=%
If %servP%=="" set servP=MQPROVIDER

REM ****************************************************************
REM ********  PART 2 - Obtain details for CONSUMER node ************
REM ****************************************************************

SET /P nodeC=Enter IIB Node name (default is IB10NODE_CMQ): %=%
If %nodeC%=="" set nodeC=IB10NODE_CMQ

SET /P portC=Enter port for %nodeC% web admin https listener (default is 4427): %=%
If %portC%=="" set portC=4427

SET /P servC=Enter server name for %nodeC% (default is MQCONSUMER): %=%
If %servC%=="" set servC=MQCONSUMER

@echo Thankyou, using following values: 
@ECHO MQPROVIDER ( %nodeP%, %portP%, %servP%); 
@echo MQCONSUMER ( %nodeC%, %portC%, %servC%);
@echo Node %nodeP% and %nodeC% must be fully started to proceed to the next stage. 
@echo ...  Ok to proceed? Use Ctrl-C to terminate.
PAUSE

REM ************************************
REM *** Nodes created in toolkit     ***
REM *** Assume nodes already started ***
REM ************************************ 


REM ***********************************************************************************
REM ********  PART 6 - Set up to allow access to HRDB Database from PROVIDER node ***
REM ***********************************************************************************

@ECHO -
@ECHO -----  Set up JDBC config to allow access to HRDB database from %nodeP% 

@ECHO -----  Set MySecurityID  --------
call c:\student10\Create_HR_database\create_HRDB_MySecurityID.cmd %nodeP%

@ECHO -----  Set JDBC Configuration -------
call c:\student10\Create_HR_database\create_HRDB_JDBC_connections.cmd %nodeP%

@ECHO -----  Set ODBC Configuration ------
call c:\student10\Create_HR_database\SetODBCSecurityForHRDB.cmd %nodeP%

@echo -
REM ************************************************
REM ********  PART 7 - WebAdmin set up for nodes ***
REM ************************************************

@ECHO -----  Create https listener and SSL Truststore config for Web Admin on %nodeP%  ------
call c:\student10\webadmin\install\create_webadmin_security_listener.cmd %nodeP% %portP%

@echo Now for CONSUMER node 
echo off

REM *****  Create https listener and SSL Truststore config for Web Admin on %nodeC% ******
call c:\student10\webadmin\install\create_webadmin_security_listener.cmd %nodeC% %portC%
@echo -
REM ****************************************************************
REM ********  PART 8 - Restart nodes for changes to take effect. ***
REM ****************************************************************
REM ** Start provider first so that its likely to get 7800 port 
@echo on
@Echo Restart nodes to make WebUI changes effective .... 
@echo Stopping IIB Node %nodeC%
mqsistop %nodeC%
@echo Stopping IIB Node %nodeP%
mqsistop %nodeP%
@echo Starting IIB Node %nodeP%
mqsistart %nodeP%
@echo Starting IIB Node %nodeC%
mqsistart %nodeC%

@echo Configure %nodeP% and %nodeC% Complete. 