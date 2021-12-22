set node1=%~1

echo Creating JDBC connections for %node1% for SAMPLE database (common)
mqsicreateconfigurableservice %node1% -c JDBCProviders -o SAMPLE -n connectionUrlFormat,connectionUrlFormatAttr1,connectionUrlFormatAttr2,connectionUrlFormatAttr3,connectionUrlFormatAttr4,connectionUrlFormatAttr5,databaseName,databaseType,databaseVersion,description,environmentParms,jarsURL,jdbcProviderXASupport,maxConnectionPoolSize,portNumber,securityIdentity,serverName,type4DatasourceClassName,type4DriverClassName  -v "jdbc:db2://[serverName]:[portNumber]/[databaseName]:user=[user];password=[password];","","","","","","SAMPLE","DB2 Universal Database","10.1","default_Description","default_none","C:\IBM\SQLLIB\java","true","0","50000","mySecurityId","localhost","com.ibm.db2.jcc.DB2XADataSource","com.ibm.db2.jcc.DB2Driver"

echo Creating DB security for %node1% for SAMPLE database (common)
mqsisetdbparms %node1% -n jdbc::SAMPLE -u iibadmin -p passw0rd
