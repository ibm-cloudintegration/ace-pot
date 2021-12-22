set qmgr1=%~1


@REM create MQ resources for MQ Topology Labs


runmqsc %qmgr1% < C:\student10\MQ_Topology\Install\MQTopologyLabs%qmgr1%.mqsc

