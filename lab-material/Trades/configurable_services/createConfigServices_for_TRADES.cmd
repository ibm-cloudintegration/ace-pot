echo on
set node1=""
set qmgr1=""
set serv1=""
set control1=""
set capturestore1=""
set capturestore_dsname1=""
set capturestore_schema1=""
set capturesource1=""
set datadest1=""

REM  SET /P control1=Press return to accept all defaults: %=%
REM  If %control1%=="" goto Commands

SET /P node1=Enter IIB Node name (default is IB10NODE): %=%
If %node1%=="" set node1=IB10NODE

SET /P serv1=Enter IIB server name (default is server1): %=%
If %serv1%=="" set serv1=server1

SET /P capturestore1=Enter Data Capture Store Config Service name (default is TRADES): %=%
If %capturestore1%=="" set capturestore1=TRADES

SET /P capturestore_dsname1=Enter Data Capture Store database name (default is TRADES): %=%
If %capturestore_dsname1%=="" set capturestore_dsname1=TRADES

SET /P capturestore_schema1=Enter Data Capture Store database schema (default is IIBADMIN): %=%
If %capturestore_schema1%=="" set capturestore_schema1=IIBADMIN

SET /P capturesource1=Enter Data Capture Source name (default is TRADES_SOURCE): %=%
If %capturesource1%=="" set capturesource1=TRADES_SOURCE

SET /P datadest1=Enter Data Destination for Replay (default is TRADES_REDIRECT_TO_BPM): %=%
If %datadest1%=="" set datadest1=TRADES_REDIRECT_TO_BPM



SET /P qmgr1=Enter IIB QMgr name to send the Replay requests to (default is IB10QMGR): %=%
If %qmgr1%=="" set qmgr1=IB10QMGR



REM  :Commands

@echo Creating configurable services for %node1% (TRADES source/datastore/destination), and Queue manager = %qmgr1%.

@echo Creating Data capture Store configurable service
mqsicreateconfigurableservice %node1% -c DataCaptureStore -o %capturestore1% -n backoutQueue,commitCount,commitIntervalSecs,dataSourceName,egForRecord,egForView,queueName,schema,threadPoolSize,useCoordinatedTransaction  -v "SYSTEM.BROKER.DC.BACKOUT","10","5",%capturestore_dsname1%,%serv1%,%serv1%,"SYSTEM.BROKER.DC.RECORD",%capturestore_schema1%,"10","false"

@echo Creating Data capture source configurable service
mqsicreateconfigurableservice %node1% -c DataCaptureSource -o %capturesource1% -n dataCaptureStore,topic  -v %capturestore1%,"$SYS/Broker/%node1%/Monitoring/%serv1%/#"

@echo Creating Data Destination configurable service
mqsicreateconfigurableservice %node1% -c DataDestination -o %datadest1% -n egForReplay,endpoint,endpointType  -v %serv1%,"wmq:/msg/queue/TRADE.FIX.IN@%qmgr1%","WMQDestination"
