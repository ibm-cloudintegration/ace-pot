SET node1=""

SET /P node1=Enter Node where Trades application is deployed (default is IB10NODE, using server1): %=%
If %node1%=="" set node1="IB10NODE"

mqsichangeproperties IB10NODE -c MonitoringProfiles -o TRD1 -n profileProperties -p c:\student10\Trades\profiles\profileTRD1.xml
mqsichangeproperties IB10NODE -c MonitoringProfiles -o TRD2 -n profileProperties -p c:\student10\Trades\profiles\profileTRD2.xml
mqsichangeproperties IB10NODE -c MonitoringProfiles -o TRD3a -n profileProperties -p c:\student10\Trades\profiles\profileTRD3a.xml
mqsichangeproperties IB10NODE -c MonitoringProfiles -o TRD3b -n profileProperties -p c:\student10\Trades\profiles\profileTRD3b.xml
mqsichangeproperties IB10NODE -c MonitoringProfiles -o TRD3c -n profileProperties -p c:\student10\Trades\profiles\profileTRD3c.xml
mqsichangeproperties IB10NODE -c MonitoringProfiles -o TRD4 -n profileProperties -p c:\student10\Trades\profiles\profileTRD4.xml
mqsichangeproperties IB10NODE -c MonitoringProfiles -o TRD5 -n profileProperties -p c:\student10\Trades\profiles\profileTRD5.xml
mqsichangeproperties IB10NODE -c MonitoringProfiles -o TRD6 -n profileProperties -p c:\student10\Trades\profiles\profileTRD6.xml