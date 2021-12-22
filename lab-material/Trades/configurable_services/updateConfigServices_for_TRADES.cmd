mqsichangeproperties IB10NODE -c DataCaptureSource -o Trades_Source -n dataCaptureStore,topic  -v "Trades","$SYS/Broker/IB10NODE/Monitoring/server1/#"

mqsichangeproperties IB10NODE -c DataCaptureStore -o Trades -n backoutQueue,commitCount,commitIntervalSecs,dataSourceName,egForRecord,egForView,queueName,schema,threadPoolSize,useCoordinatedTransaction  -v "SYSTEM.BROKER.DC.BACKOUT","10","5","TRADES","server1","server1","SYSTEM.BROKER.DC.RECORD","IIBADMIN","10","false"

mqsichangeproperties IB10NODE -c DataDestination -o Trades_Redirect_to_BPM -n egForReplay,endpoint,endpointType  -v "server1","wmq:/msg/queue/TRADE.FIX.IN@IB10QMGR","WMQDestination"