set qmgr1=%~1


@REM Create WLM queues THCreated 20150225


runmqsc %qmgr1% < C:\student10\Workload_Management\install\MQSetup\Workload_management.mqsc

