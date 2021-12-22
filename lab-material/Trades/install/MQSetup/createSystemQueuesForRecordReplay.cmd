set qmgr1=%~1


@REM Create SYSTEM queues


runmqsc %qmgr1% < c:\student10\Trades\install\MQSetup\SystemQueuesForRecordReplay.mqsc

