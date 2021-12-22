@echo off
echo This command file must be run within an Integration Bus Command Console.
SET node1=""
SET runtime=""
SET runtime_from=""
SET runtime_to=""
SET toolkit=""
SET toolkit_from=""
SET toolkit_to=""
REM *****************************************************
REM ********  PART 1 - prompt for input      ************
REM *****************************************************
echo Betaworks Analytics Lab guide Rnode setup.
REM *
SET /P node1=Enter IIB Node name (default is IB10NODE): %=%
If %node1%=="" set node1="IB10NODE"
REM *
SET /P runtime=Enter R Node runtime file name (default is RNodeRuntime-1.0.0.20150417-1641.par): %=%
If %runtime%=="" set runtime="RNodeRuntime-1.0.0.20150417-1641.par"
REM *
SET /P runtime_from=Enter R Node runtime from folder (default is C:\student10\Analytics\Resources): %=%
If %runtime_from%=="" set runtime_from="C:\student10\Analytics\Resources"
REM *
SET /P runtime_to=Enter R Node runtime to folder (default is C:\IBM\IIB\10.0.0.0\server\bin): %=%
If %runtime_to%=="" set runtime_to="C:\IBM\IIB\10.0.0.0\server\bin"
REM *
SET /P toolkit=Enter R Node toolkit file name (default is RNodeToolkit_1.0.0.20150417-1641.jar): %=%
If %toolkit%=="" set toolkit="RNodeToolkit_1.0.0.20150417-1641.jar"
REM *
SET /P toolkit_from=Enter R Node toolkit from folder (default is C:\student10\Analytics\Resources): %=%
If %toolkit_from%=="" set toolkit_from="C:\student10\Analytics\Resources"
REM *
SET /P toolkit_to=Enter R Node toolkit to folder (default is C:\IBM\IIB\10.0.0.0\tools\plugins): %=%
If %toolkit_to%=="" set toolkit_to="C:\IBM\IIB\10.0.0.0\tools\plugins"
echo -
REM *
echo Thankyou, using values %node1%, %runtime%, %runtime_from%, %runtime_to%, %toolkit%, %toolkit_from%, %toolkit_to%
echo  Ok to proceed? Use Ctrl-C to terminate.
PAUSE
REM *****************************************************
REM ********  PART 2 - Stop %node1%          ************
REM *****************************************************
REM *
REM * (synchronous request so no need to pause)
echo -  
echo Stopping node %node1%
call mqsistop %node1%
echo - 
REM *****************************************************
REM *******  PART 2 - Delete installed rnode  	    *****
REM *****************************************************
echo About to remove R Node code from IIB. Failure messages can be ignored. 
REM echo Ok to proceed? Use Ctrl-C to terminate.
REM PAUSE
del %runtime_to%\%runtime%
del %toolkit_to%\%toolkit%
REM *****************************************************
REM *******  PART 4 - Install new version of rnode     **
REM *****************************************************
echo About to copy across R Node code. 
echo Ok to proceed? Use Ctrl-C to terminate.
REM PAUSE
copy %runtime_from%\%runtime% %runtime_to%
copy %toolkit_from%\%toolkit% %toolkit_to%
echo - 
echo About to Start %node1%
REM echo, Ok to proceed? Use Ctrl-C to terminate.
REM PAUSE
mqsistart %node1%
