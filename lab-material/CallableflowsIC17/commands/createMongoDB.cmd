@echo off
@echo This command file must be run within a Mongo client shell.


REM ************************************************************************
REM ********  PART 1 - get Consumer and Provider Node and server details ***
REM ************************************************************************

@echo importing json data
mongoimport --db HRDB --collection EMPLOYEE --drop --file C:\student10\Loopback\mongodb\createDB\HRDB_Employee_batch_load.json
