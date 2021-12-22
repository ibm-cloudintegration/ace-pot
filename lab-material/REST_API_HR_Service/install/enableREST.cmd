@echo off
echo This command file will enable an IIB node for REST. It must be run within an Integration Bus Command Console.

SET node=""
SET serv=""
SET /P node=Enter IIB Node name (default is TESTNODE_%USERNAME%): %=%
If %node%=="" set node="TESTNODE_%USERNAME%"

SET /P serv=Enter server name for %node% (default is default): %=%
If %serv%=="" set serv=default



echo on
mqsichangeproperties %node% -e %serv% -o ExecutionGroup -n httpNodesUseEmbeddedListener -v true

mqsichangeproperties %node% -e %serv% -o HTTPConnector -n corsEnabled -v true


Echo Restart nodes to make changes effective .... 
echo Stopping IIB Node %node%
mqsistop %node%

echo Starting IIB Node %node%
mqsistart %node%


