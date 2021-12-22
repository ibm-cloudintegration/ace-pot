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

SET /P nodeP=Enter PROVIDER IIB Node name (default is IB10NODEP): %=%
If %nodeP%=="" set nodeP="IB10NODEP"

SET /P servP=Enter server name for %nodeP% (default is PROVIDER): %=%
If %servP%=="" set servP=PROVIDER

SET /P nodeC=Enter CONSUMER IIB Node name (default is IB10NODEC): %=%
If %nodeC%=="" set nodeC="IB10NODEC"

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
REM call c:\student10\WSSecurity\PKI\Configure_Provider_PKI.cmd %nodeP% %servP%

echo configuring %nodeP% keystore: 
mqsichangeproperties %nodeP% -e %servP% -o ComIbmJVMManager -n  keystoreFile -v C:\student10\WSSecurity\Keystores\ProviderKeyStore.jks

echo configuring %nodeP% truststore: 
mqsichangeproperties %nodeP% -e %servP% -o ComIbmJVMManager  -n  truststoreFile -v C:\student10\WSSecurity\Keystores\ProviderTrustStore.jks

echo Configuring %nodeP% KEYstore password: 
mqsisetdbparms %nodeP%  -n brokerKeystore::password -u temp -p passw0rd

echo Configuring %nodeP% TRUSTstore password: 
mqsisetdbparms %nodeP%  -n brokerTruststore::password -u temp -p passw0rd

mqsireportproperties %nodeP% -o ComIbmJVMManager -a -e %servP% > C:\student10\WSSecurity\commands\%nodeP%_servP%_PKIConfigReport.txt


REM *****************************************************
REM *******  PART 2 - CONSUMER PKI                  *****
REM *****************************************************
echo - 
echo Configuring PKI for Integration Server"%servC%" on node %nodeC%
echo -
REM call c:\student10\WSSecurity\PKI\Configure_Consumer_PKI.cmd %nodeC% %servC%

echo configuring %nodeC% keystore: 
mqsichangeproperties %nodeC% -e %servC% -o ComIbmJVMManager  -n  keystoreFile -v C:\student10\WSSecurity\Keystores\ConsumerKeyStore.jks

echo configuring %nodeC% truststore: 
mqsichangeproperties %nodeC% -e %servC% -o ComIbmJVMManager  -n  truststoreFile -v C:\student10\WSSecurity\Keystores\ConsumerTrustStore.jks

echo Configuring %nodeC% KEYstore password: 
mqsisetdbparms %nodeC%  -n brokerKeystore::password -u temp -p passw0rd

echo Configuring %nodeC% TRUSTstore password: 
mqsisetdbparms %nodeC%  -n brokerTruststore::password -u temp -p passw0rd

mqsireportproperties %nodeC% -o ComIbmJVMManager -a -e %servC% > C:\student10\WSSecurity\commands\%nodeC%_%servC%_PKIConfigReport.txt


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






