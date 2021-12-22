rem Sample program for use with IBM Integration Bus
rem (c) Copyright International Business Machines Corporation 2013
rem Licensed Materials - Property of IBM

set MYCP=.\jars\slow_tcpip_app.jar

rem Ensure the correct platform JAR is found before the app is launched
rem This assumes Java is already in the PATH
java -version 2>&1 | find "amd64-64"
echo %errorlevel%
if ERRORLEVEL 1 (
  set MYCP=%MYCP%;.\jars\swt_win32.jar
) ELSE (
  set MYCP=%MYCP%;.\jars\swt_win64.jar
)

rem Launch the Workload Management sample backend application
java -classpath %MYCP% Slow_TCPIP_Application %*