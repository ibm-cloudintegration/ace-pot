@echo off
SET db=""
SET collection=""
SET fileimport=""

@echo .
@echo Script to import data to a mongoDB collection from a json file.  
@echo (Note this script can be run from any command prompt) 
@echo .
SET /P db=Enter Database to import data to (default is HRDB): %=%
If %db%=="" set db=HRDB
SET /P collection=Enter name of mongo collection (default is employee_complete): %=%
If %collection%=="" set collection=employee_complete

SET /P fileimport=Enter full path of json import file (default is c:\student10\AppConnectREST\CreateDB\employee_complete.json): %=%
If %fileimport%=="" set fileimport="c:\student10\AppConnectREST\CreateDB\employee_complete.json"

@echo .
@echo About to execute commands:
@echo (1) mongoimport /d %db% /c %collection% /drop /file %fileimport%  
@echo Ok to proceed? Use Ctrl-C to terminate.
PAUSE
echo on
mongoimport /d %db%  /c %collection%  /drop /file %fileimport% 