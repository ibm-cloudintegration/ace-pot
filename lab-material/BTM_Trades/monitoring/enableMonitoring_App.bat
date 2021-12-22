SET node1=""
SET serv1=""
SET app1=""

SET /P node1=Enter Node where the application is deployed (default is TESTNODE_%USERNAME%): %=%
If %node1%=="" set node1="TESTNODE_%USERNAME%"

SET /P serv1=Enter server where the Trades application is deployed (default is default): %=%
If %serv1%=="" set serv1=default

SET /P app1=Enter the name of the application you wish to enable for monitoring (default value is "BTM_Trades"): %=%
If %app1%=="" set app1=BTM_Trades

@echo on
mqsichangeflowmonitoring %node1% -c active -e %serv1% -k %app1% -j
