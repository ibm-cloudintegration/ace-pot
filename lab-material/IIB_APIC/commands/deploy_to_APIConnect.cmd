@echo off

REM ** IIB default values. Change these as required
set iib_node_default="TESTNODE_%USERNAME%"
set iib_server_default="default"
set iib_API_default="HR_Service"

REM ** API-Connect default values. Change these as required
set apic_server_default="eu.apiconnect.ibmcloud.com"
set apic_serverport_default="443"
set apic_user_default="betaworks_user@uk.ibm.com"
set apic_pw_default="xxxxxxxx"
set apic_org_default="BetaWorks (dev)"
set apic_title_default="Employee"
set apic_product_default="Employee"
set apic_version_default="1.0.0"
set apic_proxy_default="caplonsgprd-5.integration.ibmcloud.com:15002"

REM *** End of default values. Do not change below here.


echo *******************************************************************************
echo *** This CMD file pushes an IIB REST API definition to API Connect.         ***
echo *** Please provide values for each parameter at the prompt,                 ***
echo *** or allow the CMD file to use the following default values:              ***
echo *******************************************************************************
echo    IIB node name: %iib_node_default%
echo    IIB server name: %iib_server_default%
echo    IIB REST API: %iib_API_default%
echo.
echo    API Connect server hostname: %apic_server_default%
echo    API Connect server port: %apic_serverport_default%
echo    API Connect username: %apic_user_default%
echo    API Connect password: %apic_pw_default%
echo    API Connect Organisation/space: %apic_org_default%
echo    API Connect Title: %apic_title_default%
echo    API Connect Product: %apic_product_default%
echo    API Connect version for IIB REST API: %apic_version_default%
echo    API Connect Proxy url: %apic_proxy_default%
echo *******************************************************************************

set iib_node=""
set iib_server=""
set iib_API=""
set apic_server=""
set apic_serverport=""
set apic_user=""
set apic_pw=""
set apic_org=""
set apic_title=""
set apic_product=""
set apic_version=""
set apic_proxy=""

@echo on
@echo.
@echo off
SET /P iib_node=Enter IIB node (default is %iib_node_default%): %=%
If %iib_node%=="" set iib_node=%iib_node_default%

SET /P iib_server=Enter IIB server where REST API is running (default is %iib_server_default%): %=%
If %iib_server%=="" set iib_server=%iib_server_default%

SET /P iib_API=Enter name of IIB REST API to be published (default is %iib_API_default%): %=%
If %iib_API%=="" set iib_API=%iib_API_default%

SET /P apic_server=Enter API-Connect server hostname (default is %apic_server_default%): %=%
If %apic_server%=="" set apic_server=%apic_server_default%

SET /P apic_serverport=Enter API-Connect server port (default is %apic_serverport_default%): %=%
If %apic_serverport%=="" set apic_serverport=%apic_serverport_default%

SET /P apic_user=Enter API-Connect username (default is %apic_user_default%): %=%
If %apic_user%=="" set apic_user=%apic_user_default%

SET /P apic_pw=Enter API-Connect password for user (default is %apic_pw_default%): %=%
If %apic_pw%=="" set apic_pw=%apic_pw_default%

SET /P apic_org=Enter API-Connect Organisation and space (default is %apic_org_default%): %=%
If %apic_org%=="" set apic_org=%apic_org_default%

SET /P apic_title=Enter API-Connect Title (default is %apic_title_default%): %=%
If %apic_title%=="" set apic_title=%apic_title_default%

SET /P apic_product=Enter API-Connect Product (default is %apic_product_default%): %=%
If %apic_product%=="" set apic_product=%apic_product_default%

SET /P apic_version=Enter API-Connect Version (default is %apic_version_default%): %=%
If %apic_version%=="" set apic_version=%apic_version_default%

SET /P apic_proxy=Enter name of HTTP Proxy for %iib_API% (default is %apic_proxy_default%): %=%
If %apic_proxy%=="" set apic_proxy=%apic_proxy_default%


@echo Thankyou, about to run the command below. Ok to proceed? Use Ctrl-C to terminate.
@echo.
echo mqsipushapis %iib_node% -e %iib_server% -t %apic_server% -g %apic_serverport% -u %apic_user% -a %apic_pw% -o %apic_org% -r %apic_title% -d %apic_product% -s %apic_version% -k %iib_API% -x %apic_proxy%
@echo.
PAUSE
@echo on
mqsipushapis %iib_node% -e %iib_server% -t %apic_server% -g %apic_serverport% -u %apic_user% -a %apic_pw% -o %apic_org% -r %apic_title% -d %apic_product% -s %apic_version% -k %iib_API% -x %apic_proxy%