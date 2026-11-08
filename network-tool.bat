@echo off
 
:: colours
for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
set "GREEN=%ESC%[32m"
set "RED=%ESC%[31m"
set "NC=%ESC%[0m"
 
echo.
 
:: releasing IPv4
ipconfig /release >nul 2>&1
if %errorlevel%==0 (set "RES=%GREEN%[SUCCESS]%NC%") else (set "RES=%RED%[FAILED]%NC%")
echo.  Releasing IP %RES%
 
:: renewing IPv4 
ipconfig /renew >nul 2>&1
if %errorlevel%==0 (set "RES=%GREEN%[SUCCESS]%NC%") else (set "RES=%RED%[FAILED]%NC%")
echo.  Renewing IP  %RES%
 
:: display IPv4 info
echo.
echo.  IPv4 Info...
ipconfig | findstr /i "IPv4 Subnet Gateway"
echo.
 
pause
 
