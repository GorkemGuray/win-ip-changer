@ECHO Off
rem ************ Author : Görkem Güray******************
rem ************ Tarih : 17 Haziran 2020****************


setlocal enableextensions disabledelayedexpansion

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

set /a random=(%RANDOM% %%239) + 12 
set target_ip_address=192.168.250.%random%
set target_subnet_address=255.255.255.0
set interface_name=Wi-Fi

netsh interface ipv4 show addresses %interface_name%| findstr /r /i /c:"DHCP.*No$" >nul 2>nul



if errorlevel 1 (
    netsh interface ip set address %interface_name% static %target_ip_address% %target_subnet_address%
) else (
    netsh interface ip set address %interface_name% dhcp
)







