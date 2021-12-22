SET node1=""
SET /P node1=Enter IIB Node name from where these users will be deleted (default is IB10NODE): %=%
If %node1%=="" set node1=IB10NODE


mqsiwebuseradmin %node1% -d -u user1
mqsiwebuseradmin %node1% -d -u user2
mqsiwebuseradmin %node1% -d -u user3
mqsiwebuseradmin %node1% -d -u user4