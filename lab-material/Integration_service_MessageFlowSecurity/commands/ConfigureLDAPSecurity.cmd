@echo off
echo This command file must be run within an Integration Bus Command Console.

SET nodeP=""

SET /P nodeP=Enter PROVIDER IIB Node name (default is IB10NODE_MFS_P): %=%
If %nodeP%=="" set nodeP="IB10NODE_MFS_P"

echo Thankyou, using values %nodeP%, Ok to proceed? Use Ctrl-C to terminate.
PAUSE

echo -
echo Configuring LDAP security for Integration Node %nodeP%
echo - 
mqsisetdbparms %nodeP% -n ldap::LDAP -u cn=root -p passw0rd

echo Stopping node %nodeP%
mqsistop %nodeP%

echo Starting node %nodeP%
mqsistart %nodeP%
















