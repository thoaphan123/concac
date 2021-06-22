@echo off&color 71
title Cong Cu Toi Uu CPU
MODE 90,30

:admin
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if "%errorlevel%" NEQ "0" (
	echo: Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	echo: UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
	"%temp%\getadmin.vbs" &	exit 
)
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
CLS
echo.   ษอป
echo.   บ1บ Chon So 1 De Bat Dau Toi Uu CPU
echo.   ศอผ
echo.   ษอป
echo.   บ2บ Chon So 2 De HUY Toi Uu CPU
echo.   ศอผ
echo.
echo ------------
choice /c 123 /n /m ">>(Chon 1 Hoac 2) :" 

if %errorlevel% == 1 goto tweak
if %errorlevel% == 2 goto default 
 
::/*************************************************************************/

:tweak
title  Dang Bat Dau Toi Uu...! Vui long cho doi la hanh phuc...
for /f "tokens=2 delims==" %%a IN ('"wmic Path Win32_OperatingSystem Get Caption /format:LIST"')do (set NameOS=%%a) >nul 2>&1
echo %NameOS% | findstr "1">nul
if %errorlevel% == 0 ( goto w10
) else ( goto w7 )

:w7
title Quality Windows Audio Video Experience 
net stop QWAVE
sc config QWAVE start= demand

title IPsec Policy Agent 
net stop PolicyAgent
sc config PolicyAgent start= demand

title Program Compatibility Assistant Service 
net stop PcaSvc
sc config PcaSvc start= disabled

title Windows Connect Now - Config Registrar 
net stop wcncsvc
sc config wcncsvc start= demand

title Remote Access Connection Manager 
net stop RasMan
sc config RasMan start= demand

title IKE and AuthIP IPsec Keying Modules 
net stop IKEEXT
sc config IKEEXT start= demand

title Offline Files 
net stop CscService
sc config CscService start= demand

title Distributed Link Tracking Client 
net stop TrkWks
sc config TrkWks start= disabled


title Diagnostic Policy Service 
sc config DPS start= demand
net stop DPS

title IPHelper 
net stop iphlpsvc
sc config iphlpsvc start= disabled

title Secondary Logon 
net stop seclogon
sc config seclogon start= disabled

title Themes 
sc config Themes start= auto

title Windows Error Reporting Service 
net stop WerSvc
sc config WerSvc start= disabled


title Windows Font Cache Service 
net stop FontCache
sc config FontCache start= demand


title Superfetch 
net stop SysMain 
sc config SysMain start= demand


title Windows Search 
net stop WSearch
sc config WSearch start= disabled


title Security Center Windows 7 
net stop wscsvc
sc config wscsvc start= disabled


title Windows Time 
net stop W32Time
sc config W32Time start= demand	


title TCP/IP NetBIOS Helper 
net stop lmhosts
sc config lmhosts start= demand


title Computer Browser 
net stop Browser
sc config Browser start= disabled
	

title Workstation 
net stop LanmanWorkstation
sc config LanmanWorkstation start= demand


title Server 
net stop LanmanServer
sc config LanmanServer start= demand

title Microsoft .NET Framework NGEN v2.0.50727_X64  
net stop clr_optimization_v2.0.50727_64
sc config clr_optimization_v2.0.50727_64 start= demand


title Microsoft .NET Framework NGEN v2.0.50727_X86 
net stop clr_optimization_v2.0.50727_32
sc config clr_optimization_v2.0.50727_32 start= demand

title Microsoft .NET Framework NGEN v4.0.30319_X64 
net stop clr_optimization_v4.0.30319_64
sc config clr_optimization_v4.0.30319_64 start= demand


title Microsoft .NET Framework NGEN v4.0.30319_X86 
net stop clr_optimization_v4.0.30319_32
sc config clr_optimization_v4.0.30319_32 start= demand

title Themes 
net start Themes
sc config Themes start= auto 

color 47&cls&title Print Spooler 
choice /c YN /m "Do you want to turn off the Printer"
if %errorlevel% == 1 ( 
net stop spooler
sc config spooler start= disabled
) else ( goto a1 )

:a1
cls&title Windows Defender
choice /c YN /m "Do you want to turn off 'Windows Defender'"
if %errorlevel% == 1 (

sc config MpsSvc start= disabled
net stop MpsSvc
 
net stop WinDefend
sc config WinDefend start= disabled

) else ( goto b1 )

:b1
cls&title Windows Update 
choice /c YN /m "Do you want to turn off 'UPDATE'"
if %errorlevel% == 1 (
net stop wuauserv
sc config wuauserv start= disabled

title Background Intelligent Transfer 
net stop bits
sc config bits start= disabled
goto exit
) else ( goto exit )

:w10
title Sensor Service 
net stop SensorService
sc config SensorService start= demand

title Delivery Optimization 
sc config DoSvc start= disabled
net stop DoSvc

title Storage Service 
net stop StorSvc
sc config StorSvc start= demand

title Connected User Experiences and Telemetry 
net stop DiagTrack
sc config DiagTrack start= disabled


title Quality Windows Audio Video Experience 
net stop QWAVE
sc config QWAVE start= demand


title IPsec Policy Agent 
net stop PolicyAgent
sc config PolicyAgent start= demand

title Program Compatibility Assistant Service 
net stop PcaSvc
sc config PcaSvc start= demand

title Windows Connect Now - Config Registrar 
net stop wcncsvc
sc config wcncsvc start= demand

title Touch Keyboard and Handwriting Panel Service 
net stop TabletInputService
sc config TabletInputService start= disabled

title Remote Access Connection Manager 
net stop RasMan
sc config RasMan start= demand

title Geolocation Service 
net stop lfsvc
sc config lfsvc start= demand


title Downloaded Maps Manager 
net stop MapsBroker
sc config MapsBroker start= demand


title IKE and AuthIP IPsec Keying Modules 
net stop IKEEXT
sc config IKEEXT start= demand


title Time Broker 
net stop TimeBroker
sc config TimeBroker start= demand


title Offline Files 
net stop CscService
sc config CscService start= demand


title Distributed Link Tracking Client 
net stop TrkWks
sc config TrkWks start= disabled


title Diagnostic Policy Service 
net stop DPS
sc config DPS start= demand


title IPHelper  
net stop iphlpsvc
sc config iphlpsvc start= disabled

title Secondary Logon 
net stop seclogon
sc config seclogon start= demand

title Windows Error Reporting Service 
net stop WerSvc
sc config WerSvc start= disabled

title Windows Font Cache Service 
net stop FontCache
sc config FontCache start= demand

title Superfetch  
net stop SysMain 
sc config SysMain start= demand

title Windows Search 
net stop WSearch
sc config WSearch start= disabled

title Windows Time 
net stop W32Time
sc config W32Time start= demand	

title TCP/IP NetBIOS Helper 
net stop lmhosts
sc config lmhosts start= demand

title Computer Browser 
net stop Browser
sc config Browser start= disabled
	

title Workstation 
net stop LanmanWorkstation
sc config LanmanWorkstation start= demand

title Server  
net stop LanmanServer
sc config LanmanServer start= demand

title Themes 
net stop Themes
sc config Themes start= disabled

color 47&cls
choice /c YN /m "Do you want to turn off the 'PRINTER'"
if %errorlevel% == 1 ( 
title Print Spooler 
net stop spooler
sc config spooler start= disabled
) else ( goto a2 )

:a2
cls&title Windows Defender 
choice /c YN /m "Do you want to turn off 'WINDOWS DEFENDER'"
if %errorlevel% == 1 (

title Windows Defender Advanced Threat Protection Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t REG_DWORD /d "4" /f

title Windows Defender Antivirus Network Inspection Service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "4" /f

title SecurityHealthService 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f

title Windows Defender Antivirus Service
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f

title Windows Defender Firewall
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mpssvc" /v "Start" /t REG_DWORD /d "4" /f

title Security Center Win10 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f
) else ( goto b2 )

:b2
cls&title Windows Update
choice /c YN /m "Do you want to turn off 'UPDATE'"
if %errorlevel% == 1 (

 net stop wuauserv
sc config wuauserv start= disabled

title Background Intelligent Transfer 
net stop bits
sc config bits start= disabled

title dmwappushsvc 
net stop dmwappushservice
sc config dmwappushservice start= disabled

title Update Orchestrator Service 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d "4" /f
net stop UsoSvc
goto exit
) else ( goto exit )


::/**********************************************************/

:default 
cls&echo.
echo            ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo            บ                                                               บ
echo            บ    Cam On Ban Da Su Dung Cong Cu Toi Uu CPU Nay !     บ
echo            บ                                                               บ
echo            ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

timeout 5 /nobreak
exit 

:exit 
cls&echo.
echo            ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo            บ                                                               บ
echo            บ      Cam On Ban Da Su Dung Cong Cu Toi Uu CPU Nay !             บ
echo            บ                                                               บ
echo            ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

timeout 5 /nobreak
exit 
