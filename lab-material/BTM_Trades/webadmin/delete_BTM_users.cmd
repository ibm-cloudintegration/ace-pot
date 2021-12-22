SET node1=""
SET /P node1=Enter IIB Node name from where these users will be deleted (default is TESTNODE_%USERNAME%): %=%
If %node1%=="" set node1=TESTNODE_%USERNAME%


mqsiwebuseradmin %node1% -d -u admin1
mqsiwebuseradmin %node1% -d -u admin2
mqsiwebuseradmin %node1% -d -u admin3
mqsiwebuseradmin %node1% -d -u btm1
mqsiwebuseradmin %node1% -d -u btm2