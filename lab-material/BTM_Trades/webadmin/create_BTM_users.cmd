SET node1=""
SET /P node1=Enter IIB Node name where these users will be defined (default is TESTNODE_%USERNAME%): %=%
If %node1%=="" set node1=TESTNODE_%USERNAME%


mqsiwebuseradmin %node1% -c -u admin1 -a admin1 -r iibAdmin1
mqsiwebuseradmin %node1% -c -u admin2 -a admin2 -r iibAdmin2
mqsiwebuseradmin %node1% -c -u admin3 -a admin3 -r iibAdmin3
mqsiwebuseradmin %node1% -c -u btm1 -a btm1 -r btmRole1
mqsiwebuseradmin %node1% -c -u btm2 -a btm2 -r btmRole2