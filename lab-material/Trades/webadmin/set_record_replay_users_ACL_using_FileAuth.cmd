@rem   File authorities for ESBProfiles 1-4 

SET node1=""

SET /P node1=Enter IIB Node name where the access roles will be defined (default is IB10NODE): %=%
If %node1%=="" set node1=IB10NODE



@REM ESBProfile1 - Node admin = read-only (server1), no access to Record/Replay data
mqsichangefileauth %node1% -r ESBProfile1 -p read+
mqsichangefileauth %node1% -r ESBProfile1 -e server1 -p read+
mqsichangefileauth %node1% -r ESBProfile1 -o DataCapture -p read-

@REM ESBProfile2 - Node admin = read-only (server1), plus read-only access to Record/Replay data
mqsichangefileauth %node1% -r ESBProfile2 -p read+
mqsichangefileauth %node1% -r ESBProfile2 -e server1 -p read+
mqsichangefileauth %node1% -r ESBProfile2 -o DataCapture -p read+

@REM ESBProfile3 - Node admin = read/update/execute access (server1); no access to Record/Replay data
mqsichangefileauth %node1% -r ESBProfile3 -p read+,write+,execute+
mqsichangefileauth %node1% -r ESBProfile3 -e server1 -p read+,write+,execute+
mqsichangefileauth %node1% -r ESBProfile3 -o DataCapture -p read-

@REM ESBProfile4 - Node admin = read/update/execute access (server1); full access to Record/Replay data (including permission to replay)
mqsichangefileauth %node1% -r ESBProfile4 -p read+,write+,execute+
mqsichangefileauth %node1% -r ESBProfile4 -e server1 -p read+,write+,execute+
mqsichangefileauth %node1% -r ESBProfile4 -o DataCapture -p read-,write+,execute+


