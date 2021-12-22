echo off
SET node1=""

echo Updating ODM configurable service DecisionServiceRepository

SET /P node1=Enter IIB Node name (default is TESTNODE_%USERNAME%): %=%
If %node1%=="" set node1="TESTNODE_%USERNAME%"

mqsichangeproperties %node1% -c DecisionServiceRepository -o Default -n JDBCProviderName,resManagementHost,resManagementPort,resManagementProfiling  -v "ODMDS","BETAWORKS-ESB10","1883","false"