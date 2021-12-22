
REM Define queues for BTM - need System queues and some queues for the BTM_Trades app
REM *********************************************************************************

echo Creating System queues for BTM
runmqsc IB10QMGR < c:\student10\BTM_Trades\install\MQSetup\SystemQueuesForBTM.mqsc
echo .
echo Creating Trades queues for BTM
runmqsc IB10QMGR < c:\student10\BTM_Trades\install\MQSetup\TradeQueuesForBTM.mqsc




