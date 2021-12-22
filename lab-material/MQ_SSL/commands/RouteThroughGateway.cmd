@echo off
set ip_address_string="IP Address"
rem Uncomment the following line when using Windows 7 (with removing "rem")!
set ip_address_string="IPv4 Address"

SET LocalIP=""
Set LocalGW=""

echo Network Connection Test
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do ( 
echo your ip address is %%f 
set LocalIP=%%f 
)

set GW_address_string="Default Gateway . . . . . . . . . : 192.168"
echo gw Connection Test
for /f "usebackq tokens=2 delims=:" %%g in (`ipconfig ^| findstr /c:%gw_address_string%`) do ( 
echo Your GW Address is: %%g
set LocalGW=%%g 
)


echo adding route definition for %LocalIP% traffic to go through %LocalGW% ...
echo Existing route table: 
route print 

route delete %LocalIP% mask 255.255.255.255 %LocalGW% metric 1
route add %LocalIP% mask 255.255.255.255 %LocalGW% metric 1

echo Modified route table: 
route print 

echo reboot to remove the entry 

