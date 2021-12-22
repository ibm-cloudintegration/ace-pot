@echo off
@echo This command file must be run within an Integration Bus Command Console.

SET newStockPort=""


SET /P newStockPort=Enter the port that IIB Warehouse is running on default is 7800): %=%
If %newStockPort%=="" set newStockPort=7800

@echo Thankyou, using values %newStockPort%, Ok to proceed? Use Ctrl-C to terminate.
PAUSE
@echo on

c:\tools\curl\curl -X POST http://localhost:%newStockPort%/drive/newstock --data @c:\student10\AppConnectIIB\resources\purple_jumper.txt

@echo ......
@echo Now Check googlesheets :o)








