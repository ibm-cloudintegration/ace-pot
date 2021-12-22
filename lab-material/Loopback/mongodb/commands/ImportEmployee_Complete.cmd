echo off
SET database=""
SET collection=""
SET fileimport=""
SET filefolder=""

SET /P database=Enter Database to import collection (default is HRDB): %=%
If %database%=="" set database=HRDB
SET /P collection=Enter name of mongoDB collection for imported data, (default is employee_complete): %=%
If %collection%=="" set collection=employee_complete
SET /P fileimport=Enter JSON file containing data to add (default is HRDB_employee_complete_batch_upload.json): %=%
If %fileimport%=="" set fileimport=HRDB_employee_complete_batch_upload.json
SET /P filefolder=Enter full path of folder location (default is C:\student10\Loopback\mongodb\createDB): %=%
If %filefolder%=="" set filefolder=C:\student10\Loopback\mongodb\createDB
@echo .
@echo About to execute command:
@echo mongoimport --db %database% --collection %collection% --drop --file %filefolder%\%fileimport% 
@echo .
@echo Ok to proceed? Use Ctrl-C to terminate.
PAUSE
mongoimport --db %database% --collection %collection% --drop --file %filefolder%\%fileimport%
