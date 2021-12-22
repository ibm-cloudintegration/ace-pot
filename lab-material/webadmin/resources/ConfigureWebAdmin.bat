mqsichangeproperties %1 -b webadmin -o server -n enabled -v true
mqsichangeproperties %1 -b webadmin -o HTTPConnector -n port -v %2
