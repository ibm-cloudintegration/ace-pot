set node1=%~1

echo Creating database security for %node1% (HRDB database).

mqsisetdbparms %node1% -n HRDB -u iibuser -p passw0rd


