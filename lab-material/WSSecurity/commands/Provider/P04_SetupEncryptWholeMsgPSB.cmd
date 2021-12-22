@echo off
echo This command file must be run within an Integration Bus Command Console.

SET nodeP=""
SET servP=""
SET nodeC=""
SET servC=""

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

echo Thankyou, using values %nodeP%, %servP%, %nodeC%, %servC%, Ok to proceed? Use Ctrl-C to terminate.
PAUSE

echo Creating Provider ENCRYPTION PolicySets and Bindings for "%servP%" on node %nodeP%
echo -
REM This statement must CALL the .cmd file, otherwise control is not passed back to the primary cmd file

REM *************************************************************
REM *******  PART 2 - PROVIDER PS/PSBs  EncryptWholeMsg     *****
REM *************************************************************

echo Deleting PROVIDER PolicySet configurable service
mqsideleteconfigurableservice %nodeP% -c PolicySets -o myProviderPolicySet 

echo Deleting PROVIDER PolicySetBinding configurable service
mqsideleteconfigurableservice %nodeP% -c PolicySetBindings -o myProviderPolicySetBinding

echo Creating PROVIDER PolicySet configurable service
mqsicreateconfigurableservice %nodeP% -c PolicySets -o myProviderPolicySet 

echo Creating PROVIDER PolicySetBindings configurable service
mqsicreateconfigurableservice %nodeP% -c PolicySetBindings -o myProviderPolicySetBinding

echo Importing PROVIDER Policy Set For Authentication ONLY  
mqsichangeproperties %nodeP% -c PolicySets -o myProviderPolicySet -n ws-security -p C:\student10\WSSecurity\commands\EncryptWholeMsg\EncryptWholeMsgmyProviderPolicySet.xml

echo Importing PROVIDER Policy Set Binding for Authentication ONLY
mqsichangeproperties %nodeP% -c PolicySetBindings -o myProviderPolicySetBinding -n ws-security -p C:\student10\WSSecurity\commands\EncryptWholeMsg\EncryptWholeMsgmyProviderPolicySetBinding.xml
echo -
echo - Changing association - PROVIDER
echo ------------------------
echo changing associated policy sets %nodeP%
mqsichangeproperties %nodeP% -c PolicySetBindings -o myProviderPolicySetBinding -n associatedPolicySet -v myProviderPolicySet


echo reporting PROVIDER Policy Set
mqsireportproperties %nodeP% -c PolicySets -o myProviderPolicySet -r > %nodeP%EncryptWholeMsgPolicySet.txt

echo reporting PROVIDER Policy Set Binding
mqsireportproperties %nodeP% -c PolicySetBindings -o myProviderPolicySetBinding -r > %nodeP%EncryptWholeMsgPolicySetsBinding.txt



REM ************************************************************
REM *******  PART 3 - CONSUMER PS/PSBs EncryptWholeMsg     *****
REM ************************************************************
echo -
echo Creating CONSUMER PolicySets and Bindings for "%servC%" on node %nodeC%

echo Deleting CONSUMER PolicySet configurable service
mqsideleteconfigurableservice %nodeC% -c PolicySets -o myConsumerPolicySet 

echo Deleting CONSUMER PolicySetBinding configurable service
mqsideleteconfigurableservice %nodeC% -c PolicySetBindings -o myConsumerPolicySetBinding

echo Creating CONSUMER PolicySet configurable service
mqsicreateconfigurableservice %nodeC% -c PolicySets -o myConsumerPolicySet 

echo Creating CONSUMER PolicySetBindings configurable service
mqsicreateconfigurableservice %nodeC% -c PolicySetBindings -o myConsumerPolicySetBinding

echo Importing CONSUMER Policy Set  
mqsichangeproperties %nodeC% -c PolicySets -o myConsumerPolicySet -n ws-security -p C:\student10\WSSecurity\commands\EncryptWholeMsg\EncryptWholeMsgmyConsumerPolicySet.xml

echo Importing CONSUMER Policy Set Binding
mqsichangeproperties %nodeC% -c PolicySetBindings -o myConsumerPolicySetBinding -n ws-security -p C:\student10\WSSecurity\commands\EncryptWholeMsg\EncryptWholeMsgmyConsumerPolicySetBinding.xml


echo Changing association - CONSUMER
echo --------------------
echo changing associated policy sets %nodeC%
mqsichangeproperties %nodeC% -c PolicySetBindings -o myConsumerPolicySetBinding -n associatedPolicySet -v myConsumerPolicySet

echo Reporting Policyset and Binding
echo -------------------------------
echo reporting CONSUMER Policy Set
mqsireportproperties %nodeC% -c PolicySets -o myConsumerPolicySet -r > %nodeC%EncryptWholeMsgPolicySet.txt

echo reporting CONSUMER Policy Set Binding
mqsireportproperties %nodeC% -c PolicySetBindings -o myConsumerPolicySetBinding -r > %nodeC%EncryptWholeMsgPolicySetsBinding.txt


REM *****************************************************
REM *******  PART 4 - Make Changes effective        *****
REM *****************************************************
echo -
echo - Stopping and restarting node %nodeP% for PS and PSB EncryptWholeMsg definitions to take effect
echo -
echo -
echo - Stopping and restarting node %nodeP% for PS and PSB EncryptPartialMsg definitions to take effect
echo -
echo - Stopping node %nodeP%
mqsistop %nodeP%
echo - 
echo - Stopping node %nodeC%
mqsistop %nodeC%
echo -  
echo Now manually delete "console.txt" file for %nodeP%, %servP%
echo path to directory will look something like: C:\ProgramData\IBM\MQSI\components\IB10NODEP\141dc25a-625a-4579-bba6-be9385f97dc0\
echo press enter when deleted ? Use Ctrl-C to terminate.
PAUSE 
echo -  
echo Now manually delete "console.txt" file for %nodeC%, %servC% 
echo path to directory will look something like: C:\ProgramData\IBM\MQSI\components\IB10NODEC\141dc25a-625a-4579-bba6-be9385f97dc0\
echo press enter when deleted ? Use Ctrl-C to terminate.
PAUSE
echo - Starting node %nodeP%
mqsistart %nodeP%
echo -  
echo - Starting node %nodeC%
mqsistart %nodeC%
echo -  
echo ready to rerun scenario for Whole Message encryption ....