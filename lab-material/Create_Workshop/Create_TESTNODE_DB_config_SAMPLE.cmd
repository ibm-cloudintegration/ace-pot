@echo off

SET node1=""

SET /P node1=Enter IIB Node name (default is IB10NODE): %=%
If %node1%=="" set node1="IB10NODE"

echo Thankyou, using values %node1%, Ok to proceed? Use Ctrl-C to terminate.
PAUSE

REM *****  Common    *********
call c:\student10\common\DBSetup\create_SAMPLE_MySecurityID.cmd %node1%
call c:\student10\common\DBSetup\create_SAMPLE_JDBC_connections.cmd %node1%







