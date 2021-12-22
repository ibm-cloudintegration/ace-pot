@echo off
set qmgr1=""
set node1=""


SET /P qmgr1=Enter IIB QMgr name (default is IB10QMGR): %=%
If %qmgr1%=="" set qmgr1=IB10QMGR

SET /P node1=Enter IIB Node name (default is TESTNODE_%USERNAME%): %=%
If %node1%=="" set node1=TESTNODE_%USERNAME%

@echo.
@echo -- Thankyou, using values ...
@echo QMgr         : %qmgr1% ;
@echo IIBNode      : %node1% ;
@echo.
@echo NB - %qmgr1% and %node1% must both be running to execute this script.
@echo Ok to proceed? Use Ctrl-C to terminate.
PAUSE


REM Enabling BTM
REM ************
echo
echo Enabling BTM for %node1%.
echo
mqsichangeproperties %node1% -o BrokerRegistry -n productFunctionality -v BUSINESS_TRANSACTION_MONITORING
echo.

REM Enable security for the BTM database (BTMDB)
REM ********************************************
echo Set security for %node1% (BTMDB database).
echo
mqsisetdbparms %node1% -n BTMDB -u iibadmin -p passw0rd
echo.


REM Define queues for BTM - need System queues and some queues for the BTM_Trades app
REM *********************************************************************************

echo Creating System queues for BTM
runmqsc %qmgr1% < c:\student10\BTM_Trades\install\MQSetup\SystemQueuesForBTM.mqsc
echo .
echo Creating Trades queues for BTM
runmqsc %qmgr1% < c:\student10\BTM_Trades\install\MQSetup\TradeQueuesForBTM.mqsc


@echo ---- restarting %node1%
@echo on
mqsistop %node1%
mqsistart %node1%


