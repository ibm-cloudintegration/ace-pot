echo off
SET node1=""

echo Updating ODM configurable service DecisionServiceProvider

SET /P node1=Enter IIB Node name (default is TESTNODE_%USERNAME%): %=%
If %node1%=="" set node1="TESTNODE_%USERNAME%"

mqsichangeproperties %node1% -c DecisionServiceProvider -o Default -n JDBCProviderName,resManagementHost,resManagementPort,resManagementProfiling,embeddedRulesEngineDirectory  -v "ODMDS","BETAWORKS-ESB10","1883","false","C:\Program Files\ibm\ODM88\executionserver\applicationservers\WebSphere85"