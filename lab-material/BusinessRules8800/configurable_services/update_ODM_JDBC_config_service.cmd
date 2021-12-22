echo off
SET node1=""

echo Updating ODMDS JDBC Provider configurable service 


SET /P node1=Enter IIB Node name (default is TESTNODE_%USERNAME%): %=%
If %node1%=="" set node1="TESTNODE_%USERNAME%"

mqsichangeproperties %node1% -c JDBCProviders -o ODMDS -n connectionUrlFormat,connectionUrlFormatAttr1,connectionUrlFormatAttr2,connectionUrlFormatAttr3,connectionUrlFormatAttr4,connectionUrlFormatAttr5,databaseName,databaseSchemaNames,databaseType,databaseVersion,description,environmentParms,jarsURL,jdbcProviderXASupport,maxConnectionPoolSize,portNumber,securityIdentity,serverName,type4DatasourceClassName,type4DriverClassName  -v "jdbc:db2://[serverName]:[portNumber]/[databaseName]:user=[user];password=[password];","","","","","","ODMDS","useProvidedSchemaNames","DB2 Universal Database","10.1","default_Description","default_none","C:\IBM\SQLLIB\java","true","0","50000","ODMRESSecurityId","localhost","com.ibm.db2.jcc.DB2XADataSource","com.ibm.db2.jcc.DB2Driver"