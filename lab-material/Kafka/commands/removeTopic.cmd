SET topic1=""

SET /P topic1=Enter topic to remove: %=%
If %topic1%=="" set topic1=xxxxxxx

SET CLASSPATH=;C:\IBM\SQLLIB\java\db2java.zip;C:\IBM\SQLLIB\java\db2jcc.jar;C:\IBM\SQLLIB\java\sqlj.zip;C:\IBM\SQLLIB\java\db2jcc_license_cu.jar;C:\IBM\SQLLIB\bin;C:\IBM\SQLLIB\java\common.jar


cmd /c "kafka-topics.bat --delete --zookeeper localhost:2181 --topic %topic1%"