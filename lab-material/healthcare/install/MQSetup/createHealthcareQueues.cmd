set qmgr1=%~1


@REM Create Healthcare queues


runmqsc %qmgr1% < c:\student10\healthcare\install\MQSetup\HealthcareQueues.mqsc

