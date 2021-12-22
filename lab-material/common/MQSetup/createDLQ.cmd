set qmgr1=%~1


@REM Create DLQ


runmqsc %qmgr1% < c:\student10\common\MQSetup\DLQ.mqsc

