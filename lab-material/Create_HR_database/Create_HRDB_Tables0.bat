db2 -v -td@ -f Create_HRDB_Tables1.ddl

db2 -v -td@ -f Create_HRDB_Tables_Supplementary.ddl

@echo *****************************************
@echo Check for errors. if none, press 'enter'.
@pause
exit
