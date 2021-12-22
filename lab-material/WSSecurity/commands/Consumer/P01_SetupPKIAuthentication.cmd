@echo off
echo This command file must be run within an Integration Bus Command Console.

SET nodeP=""
SET servP=""

REM *****************************************************
REM ********  PART 1 - Obtain Provider details **********
REM *****************************************************
echo Betaworks WS Security Lab guide PKI infrastructure setup.

SET /P nodeP=Enter PROVIDER IIB Node name (default is IB10NODEP): %=%
If %nodeP%=="" set nodeP="IB10NODEP"

SET /P servP=Enter server name for %nodeP% (default is PROVIDER): %=%
If %servP%=="" set servP=PROVIDER

echo Thankyou, using values %nodeP%, %servP%, Ok to proceed? Use Ctrl-C to terminate.
PAUSE

echo -
echo Configuring PKI for Integration Server "%servP%" on node %nodeP%
echo - 
REM *****************************************************
REM *******  PART 2 - Configure PROVIDER PKI        *****
REM *****************************************************
REM *

echo configuring %nodeP% keystore: 
mqsichangeproperties %nodeP% -e %servP% -o ComIbmJVMManager -n  keystoreFile -v C:\student10\WSSecurity\Keystores\ProviderKeyStore.jks
echo -
echo configuring %nodeP% truststore: 
mqsichangeproperties %nodeP% -e %servP% -o ComIbmJVMManager  -n  truststoreFile -v C:\student10\WSSecurity\Keystores\ProviderTrustStore.jks
echo -
echo Configuring %nodeP% KEYstore password: 
mqsisetdbparms %nodeP%  -n brokerKeystore::password -u temp -p passw0rd
echo -
echo Configuring %nodeP% TRUSTstore password: 
mqsisetdbparms %nodeP%  -n brokerTruststore::password -u temp -p passw0rd
echo -
mqsireportproperties %nodeP% -o ComIbmJVMManager -a -e %servP% > C:\student10\WSSecurity\commands\%nodeP%_servP%_PKIConfigReport.txt

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