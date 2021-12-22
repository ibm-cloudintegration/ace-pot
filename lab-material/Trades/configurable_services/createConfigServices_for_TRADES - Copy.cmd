
set node1=%~1
set qmgr1=%~2
set serv1=%~3

SET /P node1=Enter IIB Node name (default is IB10NODE): %=%
If %node1%=="" set node1=IB10NODE

SET /P serv1=Enter IIB server name (default is IB10NODE): %=%
If %node1%=="" set node1=IB10NODE

SET /P qmgr1=Enter IIB QMgr name to send the Replay requests to (default is IB10QMGR): %=%
If %qmgr1%=="" set qmgr1=IB10QMGR





@echo Creating configurable services for %node1% (TRADES source/datastore/destination), and Queue manager = %qmgr1%.

@echo Creating Data capture Store configurable service
mqsicreateconfigurableservice %node1% -c DataCaptureStore -o Trades -n backoutQueue,commitCount,commitIntervalSecs,dataSourceName,egForRecord,egForView,queueName,schema,threadPoolSize,useCoordinatedTransaction  -v "SYSTEM.BROKER.DC.BACKOUT","10","5","TRADES",%serv1%,%serv1%,"SYSTEM.BROKER.DC.RECORD","IIBADMIN","10","false"

@echo Creating Data capture source configurable service
mqsicreateconfigurableservice %node1% -c DataCaptureSource -o Trades_Source -n dataCaptureStore,topic  -v "Trades","$SYS/Broker/%node1%/Monitoring/%serv1%/#"

@echo Creating Data Destination configurable service
mqsicreateconfigurableservice %node1% -c DataDestination -o Trades_Redirect_to_BPM -n egForReplay,endpoint,endpointType  -v "server1","wmq:/msg/queue/TRADE.FIX.IN@%qmgr1%","WMQDestination"
