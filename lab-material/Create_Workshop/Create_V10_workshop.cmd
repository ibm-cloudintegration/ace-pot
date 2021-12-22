@echo off
@echo .
@echo This command file must be run within an Integration Bus Command Console.
@echo Press enter to accept defaults when prompted.....
@echo .
SET node1=""
SET qmgr1=""
SET qmgr2=""
SET qmgr4=""
SET serv1=""
SET webport=""
SET build1=""
SET fpnum=""

REM *****************************************************
REM ********  PART 1 - CREATE QMGR and NODE  ************
REM *****************************************************

SET /P qmgr1=Enter IIB QMgr name (default is IB10QMGR): %=%
If %qmgr1%=="" set qmgr1=IB10QMGR

SET /P qmgr2=Enter QMgr name independent of IIB for MQ Topologies Lab (default is QM2): %=%
If %qmgr2%=="" set qmgr2=QM2

SET /P qmgr4=Enter QMgr name independent of IIB for MQ SSL Lab Guide (default is QM4SSL): %=%
If %qmgr4%=="" set qmgr4=QM4SSL

SET /P node1=Enter IIB Node name (default is IB10NODE): %=%
If %node1%=="" set node1=IB10NODE

SET /P webport=Enter port for %node1% web admin HTTP listener (default is 4421, with https): %=%
If %webport%=="" set webport=4421

SET /P serv1=Enter server name for %node1% (default is server1): %=%
If %serv1%=="" set serv1=server1

SET /P build1=Enter IIB beta build number (0): %=%
If %build1%=="" set build1=0

SET /P fpnum=Enter IIB fixpack number (0): %=%
If %fpnum%=="" set fpnum=0

@echo.
@echo -- Thankyou, using values ...
@echo IIBNode      : %node1% ;
@echo IIB WebPort  : %webport% ; 
@echo DefaultServer: %serv1% ;
@echo QMgr1        : %qmgr1% ;
@echo QMgr2        : %qmgr2% ;
@echo QMgr4        : %qmgr4% ;
@echo BetaBuild Num: %build1% ;
@echo FixPack      : %fpnum% ;
@echo .
@echo NB QMgrs: %qmgr1% ; %qmgr2% ; %qmgr4% ; will be stopped, deleted and recreated. 
@echo .
@echo Ok to proceed? Use Ctrl-C to terminate.
PAUSE

echo ---- stopping IIB node %node1%:
echo on
mqsistop %node1%
@echo.
@echo ---- STOPPING queue manager %qmgr1%: 
\IBM\WebSph~1\bin\ENDMQM -i %qmgr1%
@echo.
@echo ---- DELETING queue manager %qmgr1%:
\IBM\WebSph~1\bin\DLTMQM %qmgr1%
@echo.
@echo ---- STOPPING queue manager %qmgr2%:
\IBM\WebSph~1\bin\ENDMQM -i %qmgr2%
@echo.
@echo ---- DELETING queue manager %qmgr2%:
\IBM\WebSph~1\bin\DLTMQM %qmgr2%
@echo.
@echo ---- STOPPING queue manager %qmgr4%:
\IBM\WebSph~1\bin\ENDMQM -i %qmgr4%
@echo.
@echo ---- DELETING queue manager %qmgr4%:
\IBM\WebSph~1\bin\DLTMQM %qmgr4%
@echo.
@echo ---- CREATING queue manager %qmgr1%:
\IBM\WebSph~1\bin\CRTMQM -u %qmgr1%.DLQ -sa %qmgr1%
@echo.
@echo ---- STARTING  queue manager %qmgr1%:
\IBM\WebSph~1\bin\STRMQM %qmgr1%
@echo.
@echo ---- CREATING queue manager %qmgr2%:
\IBM\WebSph~1\bin\CRTMQM -u %qmgr2%.DLQ -sa %qmgr2%
@echo.
@echo ---- STARTING  queue manager %qmgr2%:
\IBM\WebSph~1\bin\STRMQM %qmgr2%
@echo.
@echo ---- CREATING queue manager %qmgr4%:
\IBM\WebSph~1\bin\CRTMQM -u %qmgr4%.DLQ -sa %qmgr4%
@echo.
@echo ---- STARTING  queue manager %qmgr4%:
\IBM\WebSph~1\bin\STRMQM %qmgr4%
@echo off
REM PAUSE
REM ****************************************************************
REM *** This is required because some of the workshop scenario   ***
REM *** require the use of functions that need MQ                ***
REM *** These need to be manually created now                    ***
@echo on
@echo.
@echo ---- Start creating IIB Internal queues:
call c:\IBM\IIB\10.0.%build1%.%fpnum%\server\sample\wmq\iib_createqueues.cmd %qmgr1% mqbrkrs
@echo.
@echo ---- Completed creating IIB Internal queues .....

@echo.
@echo ---- Deleting IIB Node %node1%:
@echo on
mqsideletebroker %node1%
@echo.
@echo ---- Creating IIB Node %node1% 
mqsicreatebroker %node1% -i LocalSystem -q %qmgr1%
@echo.
@echo ---- Starting node %node1%
mqsistart %node1%
@echo.
@echo --- Node %node1% must be fully started to proceed to the next stage, 
@echo     creating a server. Please wait for the webadmin HTTP listener 
@echo     to start, then click Return to proceed. Use Ctrl-C to terminate.
@echo.
PAUSE
@echo.
@echo ---- Creating server "%serv1%" on node %node1%
@echo off
REM This statement must CALL the .cmd file, otherwise control is not passed back to the primary cmd file
@echo ---- creating server ...
@echo on
@echo.
call mqsicreateexecutiongroup %node1% -e %serv1%
@echo.
@echo ---- Creating https listener and SSL Truststore config for Web Admin 

call c:\student10\webadmin\install\create_webadmin_security_listener.cmd %node1% %webport%


@echo.
@echo ---- Enabling node for Healthcare extensions
REM This statement must CALL the .cmd file, otherwise control is not passed back to the primary cmd file
call mqsimode %node1% -x "healthcare,medicalDevices"


@echo off
REM *****************************************************
REM *******  PART 2 - CREATE QMGR and NODE OBJECTS  *****
REM *****************************************************

REM *****  Common to all labs  *********
REM PAUSE
@echo on
@echo.
@echo ---- Set up for all labs -------:
@echo ---- Database connectivity:
call c:\student10\common\DBSetup\create_SAMPLE_MySecurityID.cmd %node1%
@echo.
@echo ---- JDBC config:
call c:\student10\common\DBSetup\create_SAMPLE_JDBC_connections.cmd %node1%

@echo.
@echo ---- ODBC config:
call c:\student10\common\DBSetup\SetODBCSecurityForSAMPLE_DB.cmd %node1%

@echo.
@echo ---- MQ set up:
call c:\student10\common\MQSetup\createDLQ.cmd %qmgr1%
call c:\student10\common\MQSetup\createCommonQueues.cmd %qmgr1%
@echo.
@echo ---- MQ Topologies Lab:
call C:\student10\MQ_Topology\Install\MQTopologyLabsIB10QMGR.cmd %qmgr1%
call C:\student10\MQ_Topology\Install\MQTopologyLabsQM2.cmd %qmgr2%
@echo.
@echo ---- MQ SSL Lab:
call C:\student10\MQ_SSL\Install\MQSSLLabsQM4.cmd %qmgr4%

@echo.
@echo ---- Trades lab:
call c:\student10\Trades\install\MQSetup\CreateTradeQueues.cmd %qmgr1%
@echo.
@echo --- Security for Trades lab: 
call c:\student10\Trades\install\DBSetup\SetBrokerSecurityForTrades.cmd %node1%

@echo ---- Business Rules lab:
call c:\student10\BusinessRules\install\DBSecurity\create_ODMRES_SecurityId.cmd %node1%

@echo ---- MQTT lab:
call c:\student10\MQTT_Policy\install\MQSetup\CreateMQTTPolicyQueues.cmd %qmgr1%

@echo ---- Healthcare lab:
call c:\student10\healthcare\install\MQSetup\CreateHealthcareQueues.cmd %qmgr1%


@echo ---- WLM lab: 
call C:\student10\Workload_Management\install\MQSetup\CreateWLMMQResources.cmd %qmgr1%
@echo off
REM *****  BTM lab   *********
REM TH removed call c:\student10\BTM\install\MQSetup\CreateBTMQueues.cmd %qmgr1%
REM TH removed call c:\student10\BTM\install\DBSetup\SetBrokerSecurityForBTM.cmd %node1%

REM ******************************************************************************************
REM **** Stopping and restarting node %node1% for DB security definitions to take effect  ****
REM **** The Configurable Service definitions for DB items will fail if you attempt to    ****
REM **** do them before a stop/restart.                                                   ****
REM ******************************************************************************************
@echo ---- restarting %node1%
@echo on
mqsistop %node1%
@echo Enabling latest Fixpack functions
mqsichangebroker %node1% -f 10.0.0.%fpnum%
mqsistart %node1%

@echo ---- WLM lab: 
call c:\student10\Trades\configurable_services\Create_Trades_config_services.cmd %node1% %qmgr1% %serv1%
REM PAUSE 
@echo off
REM *****  Business Rules lab - Config Services  *********
REM *****  Note - Decision Service Config Service exists by default, and only one such is permitted,
REM *****  so we have to issue an update command, not a create,
@echo on
@echo --- ODM configuration: qsi
call c:\student10\BusinessRules\configurable_services\update_DecisionService_config_service.cmd %node1%

@echo --- ODM JDBC configuration: 
call c:\student10\BusinessRules\configurable_services\create_ODM_JDBC_config_service.cmd %node1%

@echo -----      create_V10_workshop script finished .... 
