set node1=%~1
set tcpipport=%~2
echo off

REM  ******  This section sets the ports for the TCPIP server and client   ************
echo Setting TCPIP server and client ports

@echo on
@echo.
@echo --- Creating configurable service for TCPIPServer using port 7778
mqsicreateconfigurableservice %node1% -c TCPIPServer -o TCPIPTutorialServerCF -n Port -v 7778
@echo.
@echo --- Creating configurable service for TCPIPClient using port 7778
mqsicreateconfigurableservice %node1% -c TCPIPClient -o TCPIPTutorialClientCF -n Port,Hostname,MinimumConnections,MaximumConnections -v 7778,localhost,5,10 

