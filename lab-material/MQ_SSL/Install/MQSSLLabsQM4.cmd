set qmgr4=%~1


@REM create MQ resources for MQ Topology Labs- SSL qmgr


runmqsc %qmgr4% < C:\student10\MQ_SSL\Install\MQSSLLabsQM4.mqsc

