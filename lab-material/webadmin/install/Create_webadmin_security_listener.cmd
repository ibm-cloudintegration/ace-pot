set node1=%~1
set webport=%~2
echo off

REM  ******  This section defines a HTTP connector for webadmin   ************
echo Setting web admin http (or https) listener to %webport%
REM mqsichangeproperties %node1% -b webadmin -o HTTPConnector -n port -v %webport%


REM *****  This cmd file configures HTTPS for the web admin tool  ******
@echo on
@echo.
@echo --- Setting web admin https listener to %webport%
mqsichangeproperties %node1% -b webadmin -o HTTPSConnector -n port -v %webport%
@echo.
@echo --- Setting web admin keystore to IIB.jks
mqsichangeproperties %node1% -b webadmin -o HTTPSConnector -n keystoreFile -v c:\student10\webadmin\keystore\IIB.jks
@echo.
@echo --- Setting keystore password for %node1%
mqsichangeproperties %node1% -b webadmin -o HTTPSConnector -n keystorePass -v passw0rd
@echo.
@echo --- Setting web admin listener to use SSL
mqsichangeproperties %node1% -b webadmin -o server -n enabled,enableSSL -v true,true
@echo.
@echo --- Setting protocol to TLS (SSLV3 not available in V10)
mqsichangeproperties %node1% -b webadmin -o HTTPSConnector -n sslProtocol -v TLS
@echo.