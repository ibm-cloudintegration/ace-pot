set qmgr1=%~1


@REM Create MQTT queue


runmqsc %qmgr1% < c:\student10\MQTT_policy\install\MQSetup\MQTTPolicyQueues.mqsc

