@echo off
SETLOCAL EnableDelayedExpansion
netsh winsock reset
netsh int ip reset
wmic nic get name, index, NetEnabled
rem wmic nic where "NetConnectionStatus=2" get name, index, NetEnabled
set /p choice="index? "
if not '%choice%'=='' set choice=%choice:~0,2%
if '%choice%'=='' set choice=12
set choice
wmic path win32_networkadapter where index=%choice% call disable
wmic path win32_networkadapter where index=%choice% call enable
pause
