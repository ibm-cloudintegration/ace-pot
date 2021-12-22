@echo off
SET broker=""
SET server=""
SET port=""
@echo .
@echo Script to change the value of the (http) integration server (embedded) listener 
@echo (Note this script must be run from an Integration Console) 
@echo .
SET /P broker=Enter Integration Node (default is TESTNODE_iibuser): %=%
If %broker%=="" set broker=TESTNODE_iibuser
SET /P server=Enter name of Integration Server (default is default): %=%
If %server%=="" set server=default
SET /P port=Enter desired http listener port value (default is 7800): %=%
If %port%=="" set port=7800
@echo .
@echo About to execute commands:
@echo (1)mqsichangeproperties %broker% -e %server% -o HTTPConnector -n explicitlySetPortNumber -v %port% 
@echo (2)mqsistop %broker% 
@echo (3)mqsistart %broker% 
@echo .
@echo * * * Ensure the Itegration Server %server% on %broker% is up and running. * * *
@echo . (note the Intregration Node %broker% will be stopped and started for the changes to become effective)
@echo Ok to proceed? Use Ctrl-C to terminate.
PAUSE
echo on
mqsichangeproperties %broker% -e %server% -o HTTPConnector -n explicitlySetPortNumber -v %port% 
@echo .... please wait, stopping %broker% ......
mqsistop %broker%
@echo  .... starting %broker% .....
mqsistart %broker%