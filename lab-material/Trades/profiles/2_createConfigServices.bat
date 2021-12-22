SET node1=""

SET /P node1=Enter Node where Trades application is deployed (default is IB10NODE, using server1): %=%
If %node1%=="" set node1="IB10NODE"

mqsicreateconfigurableservice %node1% -c MonitoringProfiles -o TRD1
mqsicreateconfigurableservice %node1% -c MonitoringProfiles -o TRD2
mqsicreateconfigurableservice %node1% -c MonitoringProfiles -o TRD3a
mqsicreateconfigurableservice %node1% -c MonitoringProfiles -o TRD3b
mqsicreateconfigurableservice %node1% -c MonitoringProfiles -o TRD3c
mqsicreateconfigurableservice %node1% -c MonitoringProfiles -o TRD4
mqsicreateconfigurableservice %node1% -c MonitoringProfiles -o TRD5
mqsicreateconfigurableservice %node1% -c MonitoringProfiles -o TRD6