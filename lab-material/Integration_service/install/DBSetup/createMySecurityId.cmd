set node1=%~1

echo Creating MySecurityID for %node1% for SAMPLE database for Integration Service lab

mqsisetdbparms %node1% -n jdbc::mySecurityId -u iibadmin -p passw0rd