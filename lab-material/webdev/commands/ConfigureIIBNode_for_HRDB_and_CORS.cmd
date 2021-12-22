@echo off
set node1="IB11NODE"
SET serv=""

SET /P node1=Enter IIB Node name (default is IB11NODE): %=%
If %node1%=="" set node1=TESTNODE_%USERNAME%

SET /P serv=Enter server name for %node% (default is default): %=%
If %serv%=="" set serv=default

@echo Ok to proceed? Use Ctrl-C to terminate.
PAUSE
@echo on
echo Creating JDBC connections for %node1% for HRDB database
mqsicreateconfigurableservice %node1% -c JDBCProviders -o HRDB -n connectionUrlFormat,connectionUrlFormatAttr1,connectionUrlFormatAttr2,connectionUrlFormatAttr3,connectionUrlFormatAttr4,connectionUrlFormatAttr5,databaseName,databaseType,databaseVersion,description,environmentParms,jarsURL,jdbcProviderXASupport,maxConnectionPoolSize,portNumber,securityIdentity,serverName,type4DatasourceClassName,type4DriverClassName  -v "jdbc:db2://[serverName]:[portNumber]/[databaseName]:user=[user];password=[password];","","","","","","HRDB","DB2 Universal Database","10.1","default_Description","default_none","C:\IBM\SQLLIB\java","true","0","50000","HRDB_SecurityID","localhost","com.ibm.db2.jcc.DB2XADataSource","com.ibm.db2.jcc.DB2Driver"

echo Creating DB security for %node1% for HRDB database
mqsisetdbparms %node1% -n jdbc::HRDB_SecurityID -u iibadmin -p passw0rd



echo on
mqsichangeproperties %node1% -e %serv% -o ExecutionGroup -n httpNodesUseEmbeddedListener -v true

mqsichangeproperties %node1% -e %serv% -o HTTPConnector -n corsEnabled -v true


Echo Restart nodes to make changes effective .... 
echo Stopping IIB Node %node1%
mqsistop %node1%

echo Starting IIB Node %node1%
mqsistart %node1%

