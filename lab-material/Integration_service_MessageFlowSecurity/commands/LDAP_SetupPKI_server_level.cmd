@echo off
echo This command file must be run within an Integration Bus Command Console.

SET nodeP=""
REM  SET servP=""


SET /P nodeP=Enter IIB Node name that will connect to SDS (default is IB10NODE_MFS_P): %=%
If %nodeP%=="" set nodeP="IB10NODE_MFS_P"

REM SET /P servP=Enter server name for %nodeP% (default is PROVIDER): %=%
REM  If %servP%=="" set servP=PROVIDER

echo Thankyou, using values %nodeP%, Ok to proceed? Use Ctrl-C to terminate.
PAUSE

echo -
echo Configuring PKI for LDAP connection from node %nodeP%
echo - 

echo configuring %node% Keystore at server level:
mqsichangeproperties %nodeP% -o BrokerRegistry -n brokerKeystoreFile -v C:\student10\Integration_service_MessageFlowSecurity\keystores\IIB.jks

echo configuring %node% Truststore at server level:
mqsichangeproperties %nodeP% -o BrokerRegistry -n brokerTruststoreFile -v C:\student10\Integration_service_MessageFlowSecurity\keystores\IIB.jks

echo Configuring %nodeP% Keystore password: 
mqsisetdbparms %nodeP% -n brokerKeystore::password -u ignore -p passw0rd

echo Configuring %nodeP% Truststore password: 
mqsisetdbparms %nodeP%  -n brokerTruststore::password -u ignore -p passw0rd

mqsireportproperties %nodeP% -o BrokerRegistry -r


REM *****************************************************************
REM *******  PART 3 - Restart node for changes to take effect  *****
REM *****************************************************************

REM **** Stopping and restarting node %nodeP% for PKI definitions to take effect  ****
echo -  
echo Stopping node %nodeP%
mqsistop %nodeP%

echo Starting node %nodeP%
mqsistart %nodeP%














