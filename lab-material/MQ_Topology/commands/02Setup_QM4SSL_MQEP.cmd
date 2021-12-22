@echo off
echo This command file must be run within an Integration Bus Command Console.

SET nodeP=""
SET PolP=""
SET nodeC=""
SET PolC=""


REM ****************************************************************************
REM ********  delete and recreate QM4SSL MQ Endpoint Policies       ************
REM ****************************************************************************


SET /P nodeP=Enter PROVIDER IIB Node name (default is IB10NODE_PMQ): %=%
If %nodeP%=="" set nodeP="IB10NODE_PMQ"

SET /P PolP=Enter Policy name used by MQ Provider application (default is QM4SSLProvider): %=%
If %PolP%=="" set PolP="QM4SSLProvider"

SET /P nodeC=Enter CONSUMER IIB Node name (default is IB10NODE_CMQ): %=%
If %nodeC%=="" set nodeC="IB10NODE_CMQ"

SET /P PolC=Enter Policy name used on MQ consumer application  (default is QM4SSLConsumer): %=%
If %PolC%=="" set PolC="QM4SSLConsumer"

@echo Thankyou, using values %nodeP%, %PolP%,  %nodeC%, %PolC%  Ok to proceed? Use Ctrl-C to terminate.
PAUSE
echo on
@echo Deleting MQEndpoint Policies for "%nodeC%" 
@call mqsideletepolicy %nodeC% -t MQEndpoint -l %PolC% 

@echo Creating MQEndpoint Policies for "%nodeC%" 
@call mqsicreatepolicy %nodeC% -t MQEndpoint -l %PolC% -f  c:\student10\MQ_Topology\Resources\Policy\QM4SSLConsumerPolicy.xml

@echo Deleting MQEndpoint Policies for "%nodeP%" 
@call mqsideletepolicy %nodeP% -t MQEndpoint -l %PolP% 

@echo Creating MQEndpoint Policies for "%nodeP%" 
@call mqsicreatepolicy %nodeP% -t MQEndpoint -l %PolP% -f  c:\student10\MQ_Topology\Resources\Policy\QM4SSLProviderPolicy.xml

@echo Check MQEndpoint Policies using web UI 
@echo %PolP% (on %nodeP%) 
@echo %PolC% (on %nodeC%) 