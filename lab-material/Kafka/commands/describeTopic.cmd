echo off
SET topic1=""

SET /P topic1=Enter topic to describe (default is employee): %=%
If %topic1%=="" set topic1=employee

SET CLASSPATH=;C:\IBM\SQLLIB\java\db2java.zip;C:\IBM\SQLLIB\java\db2jcc.jar;C:\IBM\SQLLIB\java\sqlj.zip;C:\IBM\SQLLIB\java\db2jcc_license_cu.jar;C:\IBM\SQLLIB\bin;C:\IBM\SQLLIB\java\common.jar

cmd /c "kafka-topics.bat --describe --zookeeper localhost:2181 --topic %topic1%"