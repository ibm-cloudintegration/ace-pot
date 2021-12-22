
set node1=""

SET /P node1=Enter IIB Node name (default is IB10NODE_SQLS): %=%
If %node1%=="" set node1=IB10NODE_SQLS

@echo Ok to proceed? Use Ctrl-C to terminate.
PAUSE

echo Creating JDBC connections for %node1% for HRDB database on SQL/Server


mqsicreateconfigurableservice %node1% -c JDBCProviders -o HRDB -n type4DatasourceClassName,type4DriverClassName,databaseType,jdbcProviderXASupport,portNumber,connectionUrlFormatAttr5,connectionUrlFormatAttr4,serverName,connectionUrlFormatAttr3,connectionUrlFormatAttr2,connectionUrlFormatAttr1,environmentParms,maxConnectionPoolSize,description,jarsURL,databaseName,databaseVersion,securityIdentity,connectionUrlFormat -v "com.microsoft.sqlserver.jdbc.SQLServerXADataSource","com.microsoft.sqlserver.jdbc.SQLServerDriver","Microsoft SQL Server","false","49688","","","localhost","","","","default_none","0","default_Description","C:\Program Files\Microsoft JDBC Driver 4.2 for SQL Server\sqljdbc_4.2\enu","HRDB","default_Database_Version","None required because we are using Windows Integrated Authentication (integratedSecurity=true instead of username-password security in connectionURLformat parameter)","jdbc:sqlserver://[serverName]:[portNumber];DatabaseName=[databaseName];integratedSecurity=true"

