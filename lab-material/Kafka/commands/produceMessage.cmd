echo off
SET topic1=""
SET port=""

SET /P topic1=Enter topic you want to produce messages to (default is employee): %=%
If %topic1%=="" set topic1=employee
SET /P port=Enter port that you want to connect to (server=9092, server1=9093, server2=9094, default is 9092): %=%
If %port%=="" set port=9092


SET CLASSPATH=;C:\IBM\SQLLIB\java\db2java.zip;C:\IBM\SQLLIB\java\db2jcc.jar;C:\IBM\SQLLIB\java\sqlj.zip;C:\IBM\SQLLIB\java\db2jcc_license_cu.jar;C:\IBM\SQLLIB\bin;C:\IBM\SQLLIB\java\common.jar

kafka-console-producer.bat --broker-list localhost:%port% --topic %topic1%