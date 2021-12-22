@echo off
echo This command file must be run within an Integration Bus Command Console.

SET node1=""
SET ps1=""
SET psb1=""

REM *****************************************************
REM ********  PART 1 - CREATE QMGR and NODE  ************
REM *****************************************************
echo Betaworks WS Policy Set and PolicySet binding export WHOLEMSG Encryption .

SET /P node1=Enter IIB Node name (default is IB9NODE): %=%
If %node1%=="" set node1="IB9NODE"

SET /P ps1=Enter Policy Set name for %node1% (default is myProviderPolicySet): %=%
If %ps1%=="" set ps1="myProviderPolicySet"

SET /P psb1=Enter Corresponding Policy set Binding (default is myProviderPolicySetBinding): %=%
If %psb1%=="" set psb1="myProviderPolicySetBinding"

echo Thankyou, using values %node1%, %ps1%, %psb1%, Ok to proceed? Use Ctrl-C to terminate.
PAUSE
echo -
echo Extract Policy Set %ps1% and %psb1% for Node %node1%
echo - 
echo Extracting %ps1% Policy Set
mqsireportproperties %node1% -c PolicySets -o %ps1% -n ws-security -p EncryptWholeMsg%ps1%.xml
echo - 
echo Extracting %psb1% Policy Set Binding
mqsireportproperties %node1% -c PolicySetBindings -o %psb1% -n ws-security -p EncryptWholeMsg%psb1%.xml
echo - 

REM The End ... 






