SET node1=""
SET serv1=""
SET /P node1=Enter Node where Trades application is deployed (default is IB10NODE): %=%
If %node1%=="" set node1="IB10NODE"
SET /P serv1=Enter server where Trades application is deployed (default is server1): %=%
If %serv1%=="" set serv1=server1

mqsireportflowmonitoring %node1% -e %serv1% -k Trades -f TRD1_Validate -x -p c:\student10\Trades\profiles\profileTRD1.xml
mqsireportflowmonitoring %node1% -e %serv1% -k Trades -f TRD2_Customer_Type -x -p c:\student10\Trades\profiles\profileTRD2.xml
mqsireportflowmonitoring %node1% -e %serv1% -k Trades -f TRD3a_Gold_Trade -x -p c:\student10\Trades\profiles\profileTRD3a.xml
mqsireportflowmonitoring %node1% -e %serv1% -k Trades -f TRD3b_Regular_Trade -x -p c:\student10\Trades\profiles\profileTRD3b.xml
mqsireportflowmonitoring %node1% -e %serv1% -k Trades -f TRD3c_Guest_Trade -x -p c:\student10\Trades\profiles\profileTRD3c.xml
mqsireportflowmonitoring %node1% -e %serv1% -k Trades -f TRD4_Final_Reconciliation -x -p c:\student10\Trades\profiles\profileTRD4.xml
mqsireportflowmonitoring %node1% -e %serv1% -k Trades -f TRD5_Trade_Complete -x -p c:\student10\Trades\profiles\profileTRD5.xml
mqsireportflowmonitoring %node1% -e %serv1% -k Trades -f TRD6_Failed_Trade_Workflow -x -p c:\student10\Trades\profiles\profileTRD6.xml