echo off
set node1=%~1

mqsichangeproperties %node1% -c DecisionServiceRepository -o Default -n JDBCProviderName,resManagementHost,resManagementPort,resManagementProfiling  -v "ODMDS","BETAWORKS-ESB10","1883","false"