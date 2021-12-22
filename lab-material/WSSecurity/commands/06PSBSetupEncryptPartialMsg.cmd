@echo off
@echo This command file must be run within an Integration Bus Command Console.

SET nodeP=""
SET servP=""
SET nodeC=""
SET servC=""
SET Reps=C:\student10\WSSecurity\Reports\

REM ****************************************************************************
REM ********  PART 1 - get Consumer and Provider Node and server details ************
REM ************************************************************************

SET /P nodeP=Enter PROVIDER IIB Node name (default is IB10NODEP): %=%
If %nodeP%=="" set nodeP="IB10NODEP"

SET /P servP=Enter server name for %nodeP% (default is PROVIDER): %=%
If %servP%=="" set servP=PROVIDER

SET /P nodeC=Enter CONSUMER IIB Node name (default is IB10NODEC): %=%
If %nodeC%=="" set nodeC="IB10NODEC"

SET /P servC=Enter server name for %nodeC% (default is CONSUMER): %=%
If %servC%=="" set servC=CONSUMER

@echo Thankyou, using values %nodeP%, %servP%, %nodeC%, %servC%, Ok to proceed? Use Ctrl-C to terminate.
PAUSE

@echo Creating Provider ENCRYPTION PolicySets and Bindings for "%servP%" on node %nodeP%
@echo -

REM *************************************************************
REM *******  PART 2 - PROVIDER PS/PSBs  EncryptPartMsg     *****
REM *************************************************************
@echo on
@echo Deleting PROVIDER PolicySet configurable service
mqsideleteconfigurableservice %nodeP% -c PolicySets -o myProviderPolicySet 

@echo Deleting PROVIDER PolicySetBinding configurable service
mqsideleteconfigurableservice %nodeP% -c PolicySetBindings -o myProviderPolicySetBinding

@echo Creating PROVIDER PolicySet configurable service
mqsicreateconfigurableservice %nodeP% -c PolicySets -o myProviderPolicySet 

@echo Creating PROVIDER PolicySetBindings configurable service
mqsicreateconfigurableservice %nodeP% -c PolicySetBindings -o myProviderPolicySetBinding

@echo Importing PROVIDER Policy Set For Encrypt Partial Message
mqsichangeproperties %nodeP% -c PolicySets -o myProviderPolicySet -n ws-security -p C:\student10\WSSecurity\commands\EncryptPartialMsg\EncryptPartialMSGmyProviderPolicySet.xml

@echo Importing PROVIDER Policy Set Binding for Encrypt Partial Message
mqsichangeproperties %nodeP% -c PolicySetBindings -o myProviderPolicySetBinding -n ws-security -p C:\student10\WSSecurity\commands\EncryptPartialMsg\EncryptPartialMSGmyProviderPolicySetBinding.xml
@echo -
@echo - Changing association - PROVIDER
@echo ------------------------
@echo changing associated policy sets %nodeP%
mqsichangeproperties %nodeP% -c PolicySetBindings -o myProviderPolicySetBinding -n associatedPolicySet -v myProviderPolicySet

@echo reporting PROVIDER Policy Set
mqsireportproperties %nodeP% -c PolicySets -o myProviderPolicySet -r > %Reps%EncryptPart%nodeP%_%servP%_PSConfig.txt 

@echo reporting PROVIDER Policy Set Binding
mqsireportproperties %nodeP% -c PolicySetBindings -o myProviderPolicySetBinding -r > %Reps%EncryptPart%nodeP%_%servP%_PSBConfig.txt 

@echo off
REM ************************************************************
REM *******  PART 3 - CONSUMER PS/PSBs EncryptPartMsg     *****
REM ************************************************************
@echo on
@echo -
@echo - Creating CONSUMER PolicySets and Bindings for "%servC%" on node %nodeC%

@echo - Deleting CONSUMER PolicySet configurable service
mqsideleteconfigurableservice %nodeC% -c PolicySets -o myConsumerPolicySet 

@echo - Deleting CONSUMER PolicySetBinding configurable service
mqsideleteconfigurableservice %nodeC% -c PolicySetBindings -o myConsumerPolicySetBinding

@echo - Creating CONSUMER PolicySet configurable service
mqsicreateconfigurableservice %nodeC% -c PolicySets -o myConsumerPolicySet 

@echo - Creating CONSUMER PolicySetBindings configurable service
mqsicreateconfigurableservice %nodeC% -c PolicySetBindings -o myConsumerPolicySetBinding

@echo - Importing CONSUMER Policy Set  
mqsichangeproperties %nodeC% -c PolicySets -o myConsumerPolicySet -n ws-security -p C:\student10\WSSecurity\commands\EncryptPartialMsg\EncryptPartialMSGmyConsumerPolicySet.xml

@echo - Importing CONSUMER Policy Set Binding
mqsichangeproperties %nodeC% -c PolicySetBindings -o myConsumerPolicySetBinding -n ws-security -p C:\student10\WSSecurity\commands\EncryptPartialMsg\EncryptPartialMSGmyConsumerPolicySetBinding.xml

@echo - Changing association - CONSUMER
@echo --------------------
@echo - changing associated policy sets %nodeC%
mqsichangeproperties %nodeC% -c PolicySetBindings -o myConsumerPolicySetBinding -n associatedPolicySet -v myConsumerPolicySet

@echo - Reporting Policyset and Binding
@echo -------------------------------
@echo - reporting CONSUMER Policy Set
mqsireportproperties %nodeC% -c PolicySets -o myConsumerPolicySet -r > %Reps%EncryptPart%nodeC%_%servC%_PSConfig.txt 

@echo - reporting CONSUMER Policy Set Binding
mqsireportproperties %nodeC% -c PolicySetBindings -o myConsumerPolicySetBinding -r > %Reps%EncryptPart%nodeC%_%servC%_PSBConfig.txt 

@echo off
REM *****************************************************
REM *******  PART 4 - Make Changes effective        *****
REM *****************************************************
@echo on
@echo -
@echo - Stopping and restarting node %nodeP% for PS and PSB EncryptPartialMsg definitions to take effect
@echo -
@echo - Stopping node %nodeP%
mqsistop %nodeP%
@echo - 
@echo - Stopping node %nodeC%
mqsistop %nodeC%
@echo -  
@echo - Starting node %nodeP%
mqsistart %nodeP%
@echo -  
@echo - Starting node %nodeC%
mqsistart %nodeC%
@echo -  
@echo 06SetupPSBEncryptPartialMsg command complete.