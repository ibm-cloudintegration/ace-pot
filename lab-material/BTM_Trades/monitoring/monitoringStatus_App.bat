SET node1=""

SET /P node1=Enter Node where you wish to check monitoring status (default is TESTNODE_%USERNAME%): %=%
If %node1%=="" set node1="TESTNODE_%USERNAME%"

mqsireportflowmonitoring %node1% -g -j