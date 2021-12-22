@echo off
set node1=""

SET /P node1=Enter IIB Node name (default is TESTNODE_%USERNAME%: %=%
If %node1%=="" set node1=TESTNODE_%USERNAME%
@echo on
echo Creating HRDB_SecurityID for %node1% for HRDB database.

mqsisetdbparms %node1% -n jdbc::HRDB_SecurityId -u %USERNAME% -p passw0rd