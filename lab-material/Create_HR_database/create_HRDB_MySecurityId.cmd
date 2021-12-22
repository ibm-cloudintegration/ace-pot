set node1=%~1

echo Creating MySecurityID for %node1% for HRDB database.

mqsisetdbparms %node1% -n jdbc::mySecurityId -u iibadmin -p passw0rd