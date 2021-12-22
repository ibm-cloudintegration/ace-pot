@echo off
@echo This command file must be run within an Integration Bus Command Console.

SET nodeP=""
SET servP=""
SET nodeC=""
SET servC=""
SET build1=""
SET fp1=""

REM *****************************************************************
REM ********  PART 1 - Obtain details for nodes          ************
REM *****************************************************************

SET /P nodeP=Enter PROVIDER IIB Node name (default is IB10NODEP): %=%
If %nodeP%=="" set nodeP="IB10NODEP"

SET /P servP=Enter server name for %nodeP% (default is PROVIDER): %=%
If %servP%=="" set servP=PROVIDER

SET /P nodeC=Enter CONSUMER IIB Node name (default is IB10NODEC): %=%
If %nodeC%=="" set nodeC="IB10NODEC"

SET /P servC=Enter server name for %nodeC% (default is CONSUMER): %=%
If %servC%=="" set servC=CONSUMER

REM SET /P build1=Enter IIB beta build number (0): %=%
set build1=""
If %build1%=="" set build1=0

SET /P fp1=Enter IIB Fix Pack number (0): %=%
If %fp1%=="" set fp1=0

@echo Thankyou, using values %nodeP%, %servP%, %nodeC%, %servC%, %build1%, %fp1%,
@echo Ok to proceed? Use Ctrl-C to terminate.
PAUSE

REM *****************************************************************
REM ********  PART 1 - Backup & upgrade local_policy jar ************
REM *****************************************************************

@echo - 
@echo local_policy file 
@echo - 
@echo on
IF EXIST C:\IBM\IIB\10.0.%build1%.%fp1%\common\jdk\jre\lib\security\local_policy.jar.orig (
  @echo local_policy file backup file already exists %build1% fix pack %fp1%
 ) else (
   @echo local_policy file Backup doesnt exist for build %build1% fix pack %fp1%
   @echo Backup original local_policy file in C:\IBM\IIB\10.0.%build1%.%fp1%\common\jdk\jre\lib\security\local_policy.jar.orig
   @echo -  
   copy C:\IBM\IIB\10.0.%build1%.%fp1%\common\jdk\jre\lib\security\local_policy.jar C:\IBM\IIB\10.0.%build1%.%fp1%\common\jdk\jre\lib\security\local_policy.jar.orig
      
 )

@echo upgrading local policy file to Unrestricted Policy
copy c:\student10\WSSecurity\UnRestrictedPolicyFiles\local_policy.jar C:\IBM\IIB\10.0.%build1%.%fp1%\common\jdk\jre\lib\security\local_policy.jar
@echo off
REM *****************************************************************
REM ********  PART 2 - Backup & upgrade us_export_policy ************
REM *****************************************************************
@echo on
@echo - 
@echo US_export_policy file 
@echo - 

IF EXIST C:\IBM\IIB\10.0.%build1%.%fp1%\common\jdk\jre\lib\security\US_export_policy.jar.orig (
  @echo US_export_policy file backup file already exists %build1% fix pack %fp1%
 ) else (
   @echo US_export_policy Backup doesnt exist for build %build1% fix pack %fp1%
   @echo Backup original US_export_policy file in C:\IBM\IIB\10.0.%build1%.%fp1%\common\jdk\jre\lib\security\US_export_policy.jar.orig

   copy C:\IBM\IIB\10.0.%build1%.%fp1%\common\jdk\jre\lib\security\US_export_policy.jar C:\IBM\IIB\10.0.%build1%.%fp1%\common\jdk\jre\lib\security\US_export_policy.jar.orig
      
 )

@echo upgrading local policy file 
copy c:\student10\WSSecurity\UnRestrictedPolicyFiles\US_export_policy.jar C:\IBM\IIB\10.0.%build1%.%fp1%\common\jdk\jre\lib\security\US_export_policy.jar

@echo - upgrade finshed - restarting IIB nodes for changes to take effect ... 
@echo off
REM *****************************************************************
REM *******  PART 3 - Restart nodes for changes to take effect  *****
REM *****************************************************************
@echo on
IF EXIST C:\ProgramData\IBM\MQSI\common\profiles\debug.cmd.orig (
  @echo debug.cmd file backup file already exists
 ) else (
   @echo debug.cmd doesnt exist for build %build1% fix pack %fp1%
   @echo Backup original debug.cmd in C:\ProgramData\IBM\MQSI\common\profiles\debug.cmd.orig

   copy C:\ProgramData\IBM\MQSI\common\profiles\debug.cmd C:\ProgramData\IBM\MQSI\common\profiles\debug.cmd.orig   
 )
@echo set WS debug mode in profiles  
copy c:\student10\WSSecurity\UnRestrictedPolicyFiles\debug.cmd C:\ProgramData\IBM\MQSI\common\profiles\debug.cmd
@echo off
REM *****************************************************************
REM *******  PART 4 - Restart nodes for changes to take effect  *****
REM *****************************************************************
@echo on
REM **** Stopping and restarting node %node1% for PKI definitions to take effect  ****
@echo -  
@echo Stopping node %nodeP%
mqsistop %nodeP%
@echo - 
@echo Stopping node %nodeC%
mqsistop %nodeC%
@echo -  
@echo Starting node %nodeP%
mqsistart %nodeP%
@echo -  
@echo Starting node %nodeC%
mqsistart %nodeC%
@echo 05SetJCEForEncryption Complete, ready to run scenario again.
