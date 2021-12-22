SET node1=""

SET /P node1=Enter Node where Trades application is deployed (default is IB10NODE, using server1): %=%
If %node1%=="" set node1="IB10NODE"

mqsichangeflowmonitoring IB10NODE -e server1 -k Trades -f TRD1_Validate -m TRD1
mqsichangeflowmonitoring IB10NODE -e server1 -k Trades -f TRD2_Customer_Type -m TRD2
mqsichangeflowmonitoring IB10NODE -e server1 -k Trades -f TRD3a_Gold_Trade -m TRD3a
mqsichangeflowmonitoring IB10NODE -e server1 -k Trades -f TRD3b_Regular_Trade -m TRD3b
mqsichangeflowmonitoring IB10NODE -e server1 -k Trades -f TRD3c_Guest_Trade -m TRD3c
mqsichangeflowmonitoring IB10NODE -e server1 -k Trades -f TRD4_Final_Reconciliation -m TRD4
mqsichangeflowmonitoring IB10NODE -e server1 -k Trades -f TRD5_Trade_Complete -m TRD5
mqsichangeflowmonitoring IB10NODE -e server1 -k Trades -f TRD6_Failed_Trade_Workflow -m TRD6