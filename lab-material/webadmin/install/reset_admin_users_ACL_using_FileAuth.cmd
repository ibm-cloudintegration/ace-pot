@rem   Remove File authorities for iibAdmins 1-3, and BTM user1 and user2, and remove user definitions

SET node1=""
SET serv1=""

SET /P node1=Enter IIB Node name where the access roles will be removed (default is TESTNODE_%USERNAME%): %=%
If %node1%=="" set node1=TESTNODE_%USERNAME%

SET /P serv1=Enter IIB server name that you are removing access to (default is default): %=%
If %serv1%=="" set serv1=default

mqsiwebuseradmin %node1% -d -u admin1
mqsiwebuseradmin %node1% -d -u admin2
mqsiwebuseradmin %node1% -d -u admin3
mqsiwebuseradmin %node1% -d -u btm1
mqsiwebuseradmin %node1% -d -u btm2
mqsiwebuseradmin %node1% -d -u dev1
mqsiwebuseradmin %node1% -d -u dev2

@REM iibAdmin1 - Node admin 
mqsichangefileauth %node1% -r iibAdmin1 -p all-
mqsichangefileauth %node1% -r iibAdmin1 -e %serv1% -p all-
mqsichangefileauth %node1% -r iibAdmin1 -o DataCapture -p all-

@REM iibAdmin2 - Node admin
mqsichangefileauth %node1% -r iibAdmin2 -p all-
mqsichangefileauth %node1% -r iibAdmin2 -e %serv1% -p all-
mqsichangefileauth %node1% -r iibAdmin2 -o DataCapture -p all-

@REM iibAdmin3 - Node admin 
mqsichangefileauth %node1% -r iibAdmin3 -p all-
mqsichangefileauth %node1% -r iibAdmin3 -e %serv1% -p all-
mqsichangefileauth %node1% -r iibAdmin3 -o DataCapture -p all-

@REM btmRole1 - BTM user
mqsichangefileauth %node1% -r btmRole1  -p all-
mqsichangefileauth %node1% -r btmRole1  -e %serv1% -p all-
mqsichangefileauth %node1% -r btmRole1  -o DataCapture -p all-

@REM btmRole2 - BTM user 
mqsichangefileauth %node1% -r btmRole2  -p all-
mqsichangefileauth %node1% -r btmRole2  -e %serv1% -p all-
mqsichangefileauth %node1% -r btmRole2  -o DataCapture -p all-


