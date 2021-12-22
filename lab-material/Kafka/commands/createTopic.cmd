echo off
SET topic1=""
SET repl_factor=""
SET partitions=""

SET /P topic1=Enter topic to create (default is employee): %=%
If %topic1%=="" set topic1=employee
SET /P repl_factor=Enter Replication Factor for %topic1% (default is 1): %=%
If %repl_factor%=="" set repl_factor=1
SET /P partitions=Enter number of partitions to create (default is 1): %=%
If %partitions%=="" set partitions=1

SET CLASSPATH=;C:\IBM\SQLLIB\java\db2java.zip;C:\IBM\SQLLIB\java\db2jcc.jar;C:\IBM\SQLLIB\java\sqlj.zip;C:\IBM\SQLLIB\java\db2jcc_license_cu.jar;C:\IBM\SQLLIB\bin;C:\IBM\SQLLIB\java\common.jar

kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor %repl_factor% --partitions %partitions% --topic %topic1%