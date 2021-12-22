@echo off
@echo This command file must be run within an Integration Bus Command Console.
@echo 07SetupHTTPS .... (setup HTTPS for provider node)

SET nodeP=""
SET servP=""
SET Reps=C:\student10\WSSecurity\Reports\
REM *****************************************************

@echo Betaworks WS Security Lab guide TLS setup.

SET /P nodeP=Enter PROVIDER IIB Node name (default is IB10NODEP): %=%
If %nodeP%=="" set nodeP="IB10NODEP"

SET /P servP=Enter server name for %nodeP% (default is PROVIDER): %=%
If %servP%=="" set servP=PROVIDER

@echo Thankyou, using values %nodeP%, %servP%, Ok to proceed? Use Ctrl-C to terminate.
PAUSE

@echo -
@echo Configuring https config for Integration Server "%servP%" on node %nodeP%
@echo - 

REM *****************************************************
REM *******  PART 1 - PROVIDER HTTPS                *****
REM *****************************************************
@echo on
@echo configuring %nodeP% default port number for https connector 
mqsichangeproperties %nodeP% -e %servP% -o HTTPSConnector -n  explicitlySetPortNumber -v 7848

@echo configuring %nodeP% client Auth
mqsichangeproperties %nodeP% -e %servP% -o HTTPSConnector -n  clientAuth -v true

@echo Reporting %nodeP% HTTPS config
mqsireportproperties %nodeP% -o HTTPSConnector -r -e %servP% > %Reps%TLS%nodeP%_%servP%_TLSConfigHTTPSConnector.txt
@echo off
REM *****************************************************************
REM *******  PART 3 - Restart nodes for changes to take effect  *****
REM *****************************************************************
REM **** Stopping and restarting node %node1% for PKI definitions to take effect  ****
@echo on
@echo -  
@echo Stopping node %nodeP%
mqsistop %nodeP%
@echo -  
@echo Starting node %nodeP%
mqsistart %nodeP%
@echo -
@echo 07SetupHTTPS command complete.