set qmgr1=%~1


@REM Create Trades queues


runmqsc %qmgr1% < c:\student10\Trades\install\MQSetup\TradeQueues.mqsc

