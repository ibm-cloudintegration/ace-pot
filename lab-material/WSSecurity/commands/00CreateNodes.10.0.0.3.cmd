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

SET /P nodeP=Enter IIB Node name (default is IB10NODEP): %=%
If %nodeP%=="" set nodeP="IB10NODEP"

SET /P portP=Enter port for %nodeP% web admin https listener (default is 4423): %=%
If %portP%=="" set portP=4423

SET /P serv1=Enter server name for %nodeP% (default is PROVIDER): %=%
If %servP%=="" set servP=PROVIDER

REM ****************************************************************
REM ********  PART 2 - Obtain details for CONSUMER node ************
REM ****************************************************************

SET /P nodeC=Enter IIB Node name (default is IB10NODEC): %=%
If %nodeC%=="" set nodeC="IB10NODEC"

SET /P portC=Enter port for %nodeC% web admin https listener (default is 4424): %=%
If %portC%=="" set portC=4424

SET /P servC=Enter server name for %nodeC% (default is CONSUMER): %=%
If %servC%=="" set servC=CONSUMER

@echo Thankyou, using following values: 
@echo PROVIDER ( %nodeP%, %portP%, %servP%); 
@echo CONSUMER ( %nodeC%, %portC%, %servC%);
@echo ... Ok to proceed? Use Ctrl-C to terminate.
PAUSE

REM ****************************************************************
REM ********  PART 3 - Create NODES  ************
REM ****************************************************************

REM ***** Recreate PROVIDER IB Node  ******
@echo off
@echo Stopping IIB Node %nodeP%
mqsistop %nodeP%
@echo Deleting IIB Node %nodeP%
mqsideletebroker %nodeP%
@echo Creating IIB Node %nodeP% 
mqsicreatebroker %nodeP% -i LocalSystem

REM ***** Recreate CONSUMER IB Node  ******
@echo off
@echo Stopping IIB Node %nodeC%
mqsistop %nodeC%
@echo Deleting IIB Node %nodeC%
mqsideletebroker %nodeC%
@echo Creating IIB Node %nodeC% 
mqsicreatebroker %nodeC% -i LocalSystem

REM ****************************************************************
REM ********  PART 4 - START NODES  ************
REM ****************************************************************

REM Start both Nodes 

@echo Starting node %nodeP%
mqsistart %nodeP%

@echo Starting node %nodeC%
mqsistart %nodeC%

@echo Node %nodeP% and %nodeC% must be fully started to proceed to the next stage, where we create the Integtration servers. 
@echo Press enter when both nodes are started to proceed..... (Use Ctrl-C to terminate)
PAUSE

REM ****************************************************************
REM ********  PART 5 - Create Integration Servers ************
REM ****************************************************************

@echo Creating server "%servP%" on node %nodeP%
REM This statement must CALL the .cmd file, otherwise control is not passed back to the primary cmd file
call mqsicreateexecutiongroup %nodeP% -e %servP%

@echo Creating server "%servC%" on node %nodeC%
REM This statement must CALL the .cmd file, otherwise control is not passed back to the primary cmd file
call mqsicreateexecutiongroup %nodeC% -e %servC%

REM ***********************************************************************************
REM ********  PART 6 - Set up to allow access to HRDB Database from PROVIDER node ***
REM ***********************************************************************************

@echo -
@echo -----  Set up JDBC config to allow access to HRDB database from %nodeP% 

@echo -----  Set MySecurityID  --------
call c:\student10\create_HR_database\create_HRDB_MySecurityID.cmd %nodeP%

@echo -----  Set JDBC Configuration -------
call c:\student10\create_HR_database\create_HRDB_JDBC_connections.cmd %nodeP%

@echo -----  Set ODBC Configuration ------
call c:\student10\create_HR_database\SetODBCSecurityForHRDB.cmd %nodeP%

@echo -
REM ************************************************
REM ********  PART 7 - WebAdmin set up for nodes ***
REM ************************************************

@echo -----  Create https listener and SSL Truststore config for Web Admin on %nodeP%  ------
call c:\student10\webadmin\install\create_webadmin_security_listener.cmd %nodeP% %portP%

@echo Now for CONSUMER node 
@echo off

REM *****  Create https listener and SSL Truststore config for Web Admin on %nodeC% ******
call c:\student10\webadmin\install\create_webadmin_security_listener.cmd %nodeC% %portC%
@echo -
REM ****************************************************************
REM ********  PART 8 - Restart nodes for changes to take effect. ***
REM ****************************************************************
REM ** Start provider first so that its likely to get 7800 port 
@echo Restart nodes to make WebUI changes effective .... 
@echo Stopping IIB Node %nodeC%
mqsistop %nodeC%
@echo Stopping IIB Node %nodeP%
mqsistop %nodeP%
@echo Starting IIB Node %nodeP%
mqsistart %nodeP%
@echo Starting IIB Node %nodeC%
mqsistart %nodeC%

@echo 00CreateNodes script complete.