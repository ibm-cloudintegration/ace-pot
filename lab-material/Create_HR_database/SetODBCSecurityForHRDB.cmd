set node1=%~1

echo Creating ODBC database security for %node1% (HRDB database).

mqsisetdbparms %node1% -n HRDB -u iibadmin -p passw0rd


