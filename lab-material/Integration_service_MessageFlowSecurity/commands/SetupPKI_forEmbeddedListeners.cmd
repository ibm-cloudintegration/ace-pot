@echo off
echo This command file must be run within an Integration Bus Command Console.

SET nodeP=""
SET servP=""
SET nodeC=""
SET servC=""

REM *****************************************************
REM ********  PART 1 - Collect Info  ************
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

REM *****************************************************
REM *******  PART 1 - PROVIDER PKI                  *****
REM *****************************************************

echo configuring %node% Keystore at server level:
mqsichangeproperties %nodeP% -e %servP% -o ComIbmJVMManager -n keystoreFile -v C:\student10\Integration_service_MessageFlowSecurity\keystores\ProviderKeyStore.jks

echo configuring %node% Truststore at server level:
mqsichangeproperties %nodeP% -e %servP% -o ComIbmJVMManager -n truststoreFile -v C:\student10\Integration_service_MessageFlowSecurity\keystores\ProviderTrustStore.jks

mqsireportproperties %nodeP% -o ComIbmJVMManager -a -e %servP% 

echo Configuring %nodeP% Keystore password: 
mqsisetdbparms %nodeP% -n brokerKeystore::password -u ignore -p passw0rd

echo Configuring %nodeP% Truststore password: 
mqsisetdbparms %nodeP%  -n brokerTruststore::password -u ignore -p passw0rd

echo Configuring %nodeP% %servP% sslProtocol=TLS
mqsichangeproperties %nodeP% -e %servP% -o HTTPSConnector -n sslProtocol -v TLS

mqsireportproperties %nodeP% -o ComIbmJVMManager -a -e %servP% 


REM *****************************************************
REM *******  PART 2 - CONSUMER PKI                  *****
REM *****************************************************
echo - 
echo Configuring PKI for Integration Server"%servC%" on node %nodeC%
echo -
echo configuring %nodeC% Keystore at server level:
mqsichangeproperties %nodeC% -e %servC% -o ComIbmJVMManager -n keystoreFile -v C:\student10\Integration_service_MessageFlowSecurity\keystores\ConsumerKeyStore.jks

echo configuring %node% Truststore at server level:
mqsichangeproperties %nodeC% -e %servC% -o ComIbmJVMManager -n truststoreFile -v C:\student10\Integration_service_MessageFlowSecurity\keystores\ConsumerTrustStore.jks

mqsireportproperties %nodeC% -o ComIbmJVMManager -a -e %servC% 

echo Configuring %nodeC% Keystore password: 
mqsisetdbparms %nodeC% -n brokerKeystore::password -u ignore -p passw0rd

echo Configuring %nodeC% Truststore password: 
mqsisetdbparms %nodeC% -n brokerTruststore::password -u ignore -p passw0rd

mqsireportproperties %nodeC% -o ComIbmJVMManager -a -e %servC% 


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













