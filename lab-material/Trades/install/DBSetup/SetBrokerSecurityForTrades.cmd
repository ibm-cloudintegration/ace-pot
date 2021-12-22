set node1=%~1

echo Creating database security for %node1% (TRADES database).

mqsisetdbparms %node1% -n TRADES -u iibadmin -p passw0rd


