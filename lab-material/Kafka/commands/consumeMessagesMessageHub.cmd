echo off
SET topic1=""
SET port=""

SET /P topic1=Enter topic that you want to consume from (default is employee): %=%
If %topic1%=="" set topic1=employee
SET /P port=Enter port that you want to connect to (server=9092, server1=9093, server2=9094, default is 9093): %=%
If %port%=="" set port=9093

SET CLASSPATH=;C:\IBM\SQLLIB\java\db2java.zip;C:\IBM\SQLLIB\java\db2jcc.jar;C:\IBM\SQLLIB\java\sqlj.zip;C:\IBM\SQLLIB\java\db2jcc_license_cu.jar;C:\IBM\SQLLIB\bin;C:\IBM\SQLLIB\java\common.jar

kafka-console-consumer.bat --bootstrap-server kafka01-prod02.messagehub.services.eu-gb.bluemix.net:%port% --topic %topic1% --from-beginning