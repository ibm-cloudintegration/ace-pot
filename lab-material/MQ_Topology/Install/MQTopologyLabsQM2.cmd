set qmgr2=%~1


@REM create MQ resources for MQ Topology Labs


runmqsc %qmgr2% < C:\student10\MQ_Topology\Install\MQTopologyLabs%qmgr2%.mqsc

