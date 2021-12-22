@echo off
echo This command file must be run within an Integration Bus Command Console.

SET nodeP=""
SET nodeC=""
SET ccdtS=""

REM *****************************************************
REM ********  PART 1 - CREATE QMGR and NODE  ************
REM *****************************************************
echo Betaworks MQ SSL Lab guide set BrokerRegistry properties: 

SET /P nodeP=Enter PROVIDER IIB Node name (default is IB10NODE_PMQ): %=%
If %nodeP%=="" set nodeP="IB10NODE_PMQ"


SET /P nodeC=Enter CONSUMER IIB Node name (default is IB10NODE_CMQ): %=%
If %nodeC%=="" set nodeC="IB10NODE_CMQ"

SET /P ccdtS=Set mqCCDT property (n): %=%
If %ccdtS%=="" set ccdtS=n


@echo Thankyou, using values %nodeP%, %nodeC%, mq CCDT (%ccdtS%) Ok to proceed? Use Ctrl-C to terminate.
PAUSE

@echo -
@echo Configuring MQ Client CCDT and KDB keystore for node %nodeP%
@echo - 
REM With CCDT
If %ccdtS%==y CALL mqsichangeproperties %nodeP% -o BrokerRegistry -n mqCCDT -v C:\student10\MQ_SSL\CCDT\IIBCLCHL.TAB

REM Without CCDT
If %ccdtS%==n CALL mqsichangeproperties %nodeP% -o BrokerRegistry -n mqCCDT -v ""

CALL mqsichangeproperties %nodeP% -o BrokerRegistry -n mqKeyRepository -v C:\student10\MQ_SSL\Keystores\SSLCONFIG\MQProviderKeyStore

REM Registry first to avoid BIP2282W messages ?
@echo -
@echo Configuring MQ Client CCDT and KDB keystore for node %nodeC%
@echo - 

REM With CCDT
If %ccdtS%==y CALL mqsichangeproperties %nodeC% -o BrokerRegistry -n mqCCDT -v C:\student10\MQ_SSL\CCDT\IIBCLCHL.TAB

REM Without CCDT
If %ccdtS%==n CALL mqsichangeproperties %nodeC% -o BrokerRegistry -n mqCCDT -v ""

mqsichangeproperties %nodeC% -o BrokerRegistry -n mqKeyRepository -v C:\student10\MQ_SSL\Keystores\SSLCONFIG\MQConsumerKeyStore


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

mqsireportproperties IB10NODE_CMQ -o BrokerRegistry -a
mqsireportproperties IB10NODE_PMQ -o BrokerRegistry -a
