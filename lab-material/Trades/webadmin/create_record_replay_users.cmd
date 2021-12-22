SET node1=""
SET /P node1=Enter IIB Node name where these users will be defined (default is IB10NODE): %=%
If %node1%=="" set node1=IB10NODE


mqsiwebuseradmin %node1% -c -u user1 -a passw0rd -r ESBProfile1
mqsiwebuseradmin %node1% -c -u user2 -a passw0rd -r ESBProfile2
mqsiwebuseradmin %node1% -c -u user3 -a passw0rd -r ESBProfile3
mqsiwebuseradmin %node1% -c -u user4 -a passw0rd -r ESBProfile4