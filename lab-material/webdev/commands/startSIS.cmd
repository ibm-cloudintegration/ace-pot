

REM  ******  This section defines a HTTP connector for webadmin   ************
echo Setting web admin http (or https) listener to %webport%
REM mqsichangeproperties %node1% -b webadmin -o HTTPConnector -n port -v %webport%


integrationserver SIS1 --startup-directory c:\student10\SIS\startup --deploy-directory c:\student10\SIS\deploy --dev-ui-port 14500