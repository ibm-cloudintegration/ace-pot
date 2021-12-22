SET node1=""
SET serv1=""
SET app1=""

SET /P node1=Enter Node where the application is deployed (default is IB10NODE): %=%
If %node1%=="" set node1="IB10NODE"

SET /P serv1=Enter server where the Trades application is deployed (default is server1): %=%
If %serv1%=="" set serv1=server1

SET /P app1=Enter the name of the application you wish to disable for monitoring (default value is "Trades"): %=%
If %app1%=="" set app1=Trades

@echo on
mqsichangeflowmonitoring %node1% -c inactive -e %serv1% -k %app1% -j
