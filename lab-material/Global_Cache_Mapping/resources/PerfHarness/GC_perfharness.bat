SET LIBS_HOME=C:\student10\Global_Cache_Mapping\resources\PerfHarness


java -Xms1536M -Xmx1536M -Djava.ext.dirs=%LIBS_HOME% JMSPerfHarness -to 180000 -wi 5 -tc http.HTTPRequestor -ot GET -sc BasicStats -jh localhost -jp 7800 -ur "DepartmentServiceApp/resources/departments" -mf "GC_request.txt" -rl 60 -sw 10 -cs false -mc 10000 -ss 2 -nt 50