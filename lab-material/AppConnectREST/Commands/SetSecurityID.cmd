@echo off
SET broker=""
SET mySecurityIdentity=""
SET myRESTUserID=""
SET myRESTPassword=""
@echo .
@echo Script to change the value of the (http) integration server (embedded) listener 
@echo (Note this script must be run from an Integration Console) 
@echo .
SET /P broker=Enter Integration Node (default is TESTNODE_iibuser): %=%
If %broker%=="" set broker=TESTNODE_iibuser
SET /P mySecurityIdentity=Enter name of Security Itentity to create (default is myAppConnectSecurityID): %=%
If %mySecurityIdentity%=="" set mySecurityIdentity=myAppConnectSecurityID

SET /P myRESTUserID=Enter Your REST API Username (There is no default): %=%
If %myRESTUserID%=="" echo Incorrect Value!

SET /P myRESTPassword=Enter Your REST API Password (There is no default): %=%
If %myRESTPassword%=="" echo Incorrect Value!
@echo .
@echo About to execute commands:
@echo (1) mqsisetdbparms %broker% -n rest::%mySecurityIdentity% -u %myRESTUserID% -p %myRESTPassword% 
@echo (2)mqsistop %broker% 
@echo (3)mqsistart %broker% 
@echo .
@echo * * * Ensure the Itegration Server %server% on %broker% is up and running. * * *
@echo . (note the Intregration Node %broker% will be stopped and started for the changes to become effective)
@echo Ok to proceed? Use Ctrl-C to terminate.
PAUSE
echo on
mqsisetdbparms %broker% -n rest::%mySecurityIdentity% -u %myRESTUserID% -p %myRESTPassword%
@echo .... please wait, stopping %broker% ......
mqsistop %broker%
@echo  .... starting %broker% .....
mqsistart %broker%