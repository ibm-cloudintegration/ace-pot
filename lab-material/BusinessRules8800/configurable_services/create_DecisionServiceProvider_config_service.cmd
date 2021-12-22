echo off
set node1=%~1

mqsicreateconfigurableservice %node1% -c DecisionServiceProvider -o Default -n JDBCProviderName,resManagementHost,resManagementPort,resManagementProfiling,embeddedRulesEngineDirectory  -v "ODMDS","BETAWORKS-ESB10","1883","false","C:\Program Files\ibm\ODM88\executionserver\applicationservers\WebSphere85"