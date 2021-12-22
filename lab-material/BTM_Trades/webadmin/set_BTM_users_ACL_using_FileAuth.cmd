@rem   File authorities for iibAdmins 1-3, and BTM user1 and user2

SET node1=""
SET serv1=""

SET /P node1=Enter IIB Node name where the access roles will be defined (default is TESTNODE_%USERNAME%): %=%
If %node1%=="" set node1=TESTNODE_%USERNAME%

SET /P serv1=Enter IIB server name that you are giving access to (default is default): %=%
If %serv1%=="" set serv1=default



@REM iibAdmin1 - Node admin = read-only (%serv1%), no access to Record/Replay/BTM data
mqsichangefileauth %node1% -r iibAdmin1 -p read+
mqsichangefileauth %node1% -r iibAdmin1 -e %serv1% -p read+
mqsichangefileauth %node1% -r iibAdmin1 -o DataCapture -p read-

@REM iibAdmin2 - Node admin = read/update/execute (%serv1%), no access to Record/Replay/BTM data
mqsichangefileauth %node1% -r iibAdmin2 -p read+
mqsichangefileauth %node1% -r iibAdmin2 -e %serv1% -p read+,write+,execute+
mqsichangefileauth %node1% -r iibAdmin2 -o DataCapture -p read-

@REM iibAdmin3 - Node admin = read/update/execute access (%serv1%); read access to Record/Replay/BTM data
mqsichangefileauth %node1% -r iibAdmin3 -p read+,write+,execute+
mqsichangefileauth %node1% -r iibAdmin3 -e %serv1% -p read+,write+,execute+
mqsichangefileauth %node1% -r iibAdmin3 -o DataCapture -p read+

@REM btmRole1 - BTM user,  No access to node or servers; full access to Record/Replay/BTM data (including permission to replay)
mqsichangefileauth %node1% -r btmRole1  -p read+,write-,execute-
mqsichangefileauth %node1% -r btmRole1  -e %serv1% -p read-,write-,execute-
mqsichangefileauth %node1% -r btmRole1  -o DataCapture -p read+,write+,execute+

@REM btmRole2 - BTM user,  No access to node or servers; full access to Record/Replay/BTM (but no replay)
mqsichangefileauth %node1% -r btmRole2  -p read+,write-,execute-
mqsichangefileauth %node1% -r btmRole2  -e %serv1% -p read-,write-,execute-
mqsichangefileauth %node1% -r btmRole2  -o DataCapture -p read+,write-,execute-


