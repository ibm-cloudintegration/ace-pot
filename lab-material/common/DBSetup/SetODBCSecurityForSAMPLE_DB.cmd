set node1=%~1

echo Creating ODBC database security for %node1% (SAMPLE database).

mqsisetdbparms %node1% -n SAMPLE -u iibadmin -p passw0rd


