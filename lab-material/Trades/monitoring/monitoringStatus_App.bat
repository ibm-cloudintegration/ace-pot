SET node1=""

SET /P node1=Enter Node where you wish to check monitoring status (default is IB10NODE): %=%
If %node1%=="" set node1="IB10NODE"

mqsireportflowmonitoring IB10NODE -g -j