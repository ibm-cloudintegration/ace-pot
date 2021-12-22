@echo off
echo This command file must be run within an Integration Bus Command Console.

SET nodeP=""
SET servP=""
SET nodeC=""
SET servC=""

REM *****************************************************
REM ********  PART 1 - CREATE QMGR and NODE  ************
REM *****************************************************
echo Betaworks MQ SSL Security Lab guide PKI infrastructure setup.

SET /P nodeP=Enter PROVIDER IIB Node name (default is IB10NODE_PMQ): %=%
If %nodeP%=="" set nodeP="IB10NODE_PMQ"

SET /P servP=Enter server name for %nodeP% (default is MQPROVIDER): %=%
If %servP%=="" set servP=MQPROVIDER

SET /P nodeC=Enter CONSUMER IIB Node name (default is IB10NODE_CMQ): %=%
If %nodeC%=="" set nodeC="IB10NODE_CMQ"

SET /P servC=Enter server name for %nodeC% (default is MQCONSUMER): %=%
If %servC%=="" set servC=MQCONSUMER

@echo Thankyou, using values %nodeP%, %servP%, %nodeC%, %servC%, Ok to proceed? Use Ctrl-C to terminate.
PAUSE

@echo -
@echo Configuring MQ Client CCDT and KDB keystore for Integration Server "%servP%" on node %nodeP%
@echo - 

mqsichangeproperties %nodeP% -o BrokerRegistry -n mqCCDT -v C:\student10\MQ_Topology\CCDT\AMQCLCHL.TAB
mqsichangeproperties %nodeP% -o BrokerRegistry -n mqKeyRepository -v C:\student10\MQ_Topology\Keystores\SSLCONFIG\MQProviderKeyStore

REM Registry first to avoid BIP2282W messages ?
@echo -
@echo Configuring MQ Client CCDT and KDB keystore for Integration Server "%servC%" on node %nodeC%
@echo - 

mqsichangeproperties %nodeC% -o BrokerRegistry -n mqCCDT -v C:\student10\MQ_Topology\CCDT\AMQCLCHL.TAB
mqsichangeproperties %nodeC% -o BrokerRegistry -n mqKeyRepository -v C:\student10\MQ_Topology\Keystores\SSLCONFIG\MQConsumerKeyStore


REM *****************************************************************
REM *******  PART 3 - Restart nodes for changes to take effect  *****
REM *****************************************************************

REM **** Stopping and restarting node %node1% for PKI definitions to take effect  ****
echo -  
echo Stopping node %nodeP%
mqsistop %nodeP%
echo -  
echo Starting node %nodeP%
mqsistart %nodeP%
echo -  
echo Stopping node %nodeC%
mqsistop %nodeC%
echo -  
echo Starting node %nodeC%
mqsistart %nodeC%
