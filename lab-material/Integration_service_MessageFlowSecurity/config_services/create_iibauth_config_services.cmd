@echo off
echo This command file must be run within an Integration Bus Command Console.

SET node=""

SET /P node=Enter IIB Node name (default is IB10NODE_MFS_P): %=%
If %node%=="" set node="IB10NODE_MFS_P"

echo Thankyou, using values %node%, Ok to proceed? Use Ctrl-C to terminate.
PAUSE

REM ----------------------------------------**
REM - Plain text LDAP connection profiles   **
REM ----------------------------------------**

echo Creating iibauth_default configurable service
mqsicreateconfigurableservice %node% -c SecurityProfiles -o iibauth_default -n mapping,rejectBlankpassword,propagation,passwordValue,keyStore,authorizationConfig,authenticationConfig,idToPropagateToTransport,trustStore,authentication,authorization,mappingConfig,transportPropagationConfig -v "NONE","FALSE","TRUE","MASK","Reserved for future use",\"ldap://localhost:389/cn=iibauth_default,ou=users,ou=iib,o=ibm\",\"ldap://localhost:389/ou=users,ou=iib,o=ibm?uid\","Message ID","Reserved for future use","LDAP","LDAP","",""

echo Creating iibauth_update configurable service
mqsicreateconfigurableservice %node% -c SecurityProfiles -o iibauth_update -n mapping,rejectBlankpassword,propagation,passwordValue,keyStore,authorizationConfig,authenticationConfig,idToPropagateToTransport,trustStore,authentication,authorization,mappingConfig,transportPropagationConfig -v "NONE","FALSE","TRUE","MASK","Reserved for future use",\"ldap://localhost:389/cn=iibauth_update,ou=users,ou=iib,o=ibm\",\"ldap://localhost:389/ou=users,ou=iib,o=ibm?uid\","Message ID","Reserved for future use","LDAP","LDAP","",""

echo Creating iibauth_delete configurable service
mqsicreateconfigurableservice %node% -c SecurityProfiles -o iibauth_delete -n mapping,rejectBlankpassword,propagation,passwordValue,keyStore,authorizationConfig,authenticationConfig,idToPropagateToTransport,trustStore,authentication,authorization,mappingConfig,transportPropagationConfig -v "NONE","FALSE","TRUE","MASK","Reserved for future use",\"ldap://localhost:389/cn=iibauth_delete,ou=users,ou=iib,o=ibm\",\"ldap://localhost:389/ou=users,ou=iib,o=ibm?uid\","Message ID","Reserved for future use","LDAP","LDAP","",""

REM ----------------------------------------**
REM - SSL LDAP connection profiles          **
REM   --------------------------------------**

echo Creating iibauth_default_s configurable service
mqsicreateconfigurableservice %node% -c SecurityProfiles -o iibauth_default_s -n mapping,rejectBlankpassword,propagation,passwordValue,keyStore,authorizationConfig,authenticationConfig,idToPropagateToTransport,trustStore,authentication,authorization,mappingConfig,transportPropagationConfig -v "NONE","FALSE","TRUE","MASK","Reserved for future use",\"ldaps://localhost:636/cn=iibauth_default,ou=users,ou=iib,o=ibm\",\"ldaps://localhost:636/ou=users,ou=iib,o=ibm?uid\","Message ID","Reserved for future use","LDAP","LDAP","",""

echo Creating iibauth_update_s configurable service
mqsicreateconfigurableservice %node% -c SecurityProfiles -o iibauth_update_s -n mapping,rejectBlankpassword,propagation,passwordValue,keyStore,authorizationConfig,authenticationConfig,idToPropagateToTransport,trustStore,authentication,authorization,mappingConfig,transportPropagationConfig -v "NONE","FALSE","TRUE","MASK","Reserved for future use",\"ldaps://localhost:636/cn=iibauth_update,ou=users,ou=iib,o=ibm\",\"ldaps://localhost:636/ou=users,ou=iib,o=ibm?uid\","Message ID","Reserved for future use","LDAP","LDAP","",""

echo Creating iibauth_delete_s configurable service
mqsicreateconfigurableservice %node% -c SecurityProfiles -o iibauth_delete_s -n mapping,rejectBlankpassword,propagation,passwordValue,keyStore,authorizationConfig,authenticationConfig,idToPropagateToTransport,trustStore,authentication,authorization,mappingConfig,transportPropagationConfig -v "NONE","FALSE","TRUE","MASK","Reserved for future use",\"ldaps://localhost:636/cn=iibauth_delete,ou=users,ou=iib,o=ibm\",\"ldaps://localhost:636/ou=users,ou=iib,o=ibm?uid\","Message ID","Reserved for future use","LDAP","LDAP","",""


REM -----------------------------------------------------------------------------------------**
REM - Plain text LDAP connection profiles - authorization only                               **
REM - Note the extended authorizationConfig string, including the "x-userBaseDN" component   **
REM -     This is required to establish a connection to the base LDAP root, in the absence   **
REM       of a user DN to authenticate                                                       **
REM - Also note the use of %%, first % required to escape the subsequent $2C                 **
REM -----------------------------------------------------------------------------------------**

echo Creating iibauth_authorizationonly_default configurable service
mqsicreateconfigurableservice %node% -c SecurityProfiles -o iibauth_authorizationonly_default -n mapping,rejectBlankpassword,propagation,passwordValue,keyStore,authorizationConfig,authenticationConfig,idToPropagateToTransport,trustStore,authentication,authorization,mappingConfig,transportPropagationConfig -v "NONE","FALSE","TRUE","PLAIN","Reserved for future use",\"ldap://localhost:389/cn=iibauth_default,ou=users,ou=iib,o=ibm???x-userBaseDN=ou=users%%2cou=iib%%2co=ibm\",\"\","Message ID","Reserved for future use","NONE","LDAP","",""

echo Creating iibauth_authorizationonly_update configurable service
mqsicreateconfigurableservice %node% -c SecurityProfiles -o iibauth_authorizationonly_update -n mapping,rejectBlankpassword,propagation,passwordValue,keyStore,authorizationConfig,authenticationConfig,idToPropagateToTransport,trustStore,authentication,authorization,mappingConfig,transportPropagationConfig -v "NONE","FALSE","TRUE","PLAIN","Reserved for future use",\"ldap://localhost:389/cn=iibauth_update,ou=users,ou=iib,o=ibm???x-userBaseDN=ou=users%%2cou=iib%%2co=ibm\",\"\","Message ID","Reserved for future use","NONE","LDAP","",""

echo Creating iibauth_authorizationonly_delete configurable service
mqsicreateconfigurableservice %node% -c SecurityProfiles -o iibauth_authorizationonly_delete -n mapping,rejectBlankpassword,propagation,passwordValue,keyStore,authorizationConfig,authenticationConfig,idToPropagateToTransport,trustStore,authentication,authorization,mappingConfig,transportPropagationConfig -v "NONE","FALSE","TRUE","PLAIN","Reserved for future use",\"ldap://localhost:389/cn=iibauth_delete,ou=users,ou=iib,o=ibm???x-userBaseDN=ou=users%%2cou=iib%%2co=ibm\",\"\","Message ID","Reserved for future use","NONE","LDAP","",""




