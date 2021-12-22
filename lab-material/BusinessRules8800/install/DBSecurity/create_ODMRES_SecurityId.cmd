echo off
set node1=%~1

mqsisetdbparms %node1% -n jdbc::ODMRESSecurityId -u iibadmin -p passw0rd