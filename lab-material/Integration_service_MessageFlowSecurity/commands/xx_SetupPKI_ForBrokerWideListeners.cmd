@echo off
echo This command file must be run within an Integration Bus Command Console.

SET nodeP=""
SET servP=""
SET nodeC=""
SET servC=""

REM *****************************************************
REM ********  PART 1 - CREATE QMGR and NODE  ************
REM *****************************************************
echo Betaworks WS Security Lab guide PKI infrastructure setup.

SET /P nodeP=Enter PROVIDER IIB Node name (default is IB10NODE_MFS_P): %=%
If %nodeP%=="" set nodeP="IB10NODE_MFS_P"

SET /P servP=Enter server name for %nodeP% (default is PROVIDER): %=%
If %servP%=="" set servP=PROVIDER

SET /P nodeC=Enter CONSUMER IIB Node name (default is IB10NODE_MFS_C): %=%
If %nodeC%=="" set nodeC="IB10NODE_MFS_C"

SET /P servC=Enter server name for %nodeC% (default is CONSUMER): %=%
If %servC%=="" set servC=CONSUMER

echo Thankyou, using values %nodeP%, %servP%, %nodeC%, %servC%, Ok to proceed? Use Ctrl-C to terminate.
PAUSE

echo -
echo Configuring PKI for Integration Server "%servP%" on node %nodeP%
echo - 
REM This statement must CALL the .cmd file, otherwise control is not passed back to the primary cmd file

REM *****************************************************
REM *******  PART 1 - PROVIDER PKI                  *****
REM *****************************************************

echo configuring %node% Keystore at Broker (node) level:
mqsichangeproperties %nodeP% -o BrokerRegistry -n brokerKeystoreFile -v C:\student10\Integration_service_JSONClient_MessageFlowSecurity\keystores\ProviderKeyStore.jks

echo configuring %node% Truststore at Broker (node) level:
mqsichangeproperties %nodeP% -o BrokerRegistry -n brokerTruststoreFile -v C:\student10\Integration_service_JSONClient_MessageFlowSecurity\keystores\ProviderTrustStore.jks

echo Configuring %nodeP% Keystore password: 
mqsisetdbparms %nodeP% -n brokerKeystore::password -u ignore -p passw0rd

echo Configuring %nodeP% Truststore password: 
mqsisetdbparms %nodeP%  -n brokerTruststore::password -u ignore -p passw0rd

mqsichangeproperties %nodeP% -b httplistener -o HTTPSConnector -n sslProtocol - v TLS

mqsireportproperties %nodeP% -o BrokerRegistry -r


REM *****************************************************
REM *******  PART 2 - CONSUMER PKI                  *****
REM *****************************************************
echo - 
echo Configuring PKI for Integration Server"%servC%" on node %nodeC%
echo -
echo configuring %nodeC% Keystore at Broker (node) level:
mqsichangeproperties %nodeC% -o BrokerRegistry -n brokerKeystoreFile -v C:\student10\Integration_service_JSONClient_MessageFlowSecurity\keystores\ConsumerKeyStore.jks

echo configuring %node% Truststore at Broker (node) level:
mqsichangeproperties %nodeC% -o BrokerRegistry -n brokerTruststoreFile -v C:\student10\Integration_service_JSONClient_MessageFlowSecurity\keystores\ConsumerTrustStore.jks

echo Configuring %nodeC% Keystore password: 
mqsisetdbparms %nodeC% -n brokerKeystore::password -u ignore -p passw0rd

echo Configuring %nodeC% Truststore password: 
mqsisetdbparms %nodeC% -n brokerTruststore::password -u ignore -p passw0rd

mqsireportproperties %nodeC% -o BrokerRegistry -r


REM *****************************************************************
REM *******  PART 3 - Restart nodes for changes to take effect  *****
REM *****************************************************************

REM **** Stopping and restarting node %node1% for PKI definitions to take effect  ****
echo -  
echo Stopping node %nodeP%
mqsistop %nodeP%
echo Stopping node %nodeC%
mqsistop %nodeC%

echo Starting node %nodeP%
mqsistart %nodeP%

echo -  
echo Starting node %nodeC%
mqsistart %nodeC%













