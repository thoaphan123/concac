@echo off&color 2f&Title Clean&mode 80,20

:main
echo.
echo      ��������������������������������������������������������������������ͻ
echo      �                 Bam Y bat dau HOAC N de huy                   �
echo      ��������������������������������������������������������������������ͼ
echo.
choice /c yn /m "Start" 

if %errorlevel% == 1 goto y
if %errorlevel% == 2 goto n


:y
COPY "Files\*.*" "%temp%\*.*"
start Files\project.bat
goto exit

:n
timeout /t 3 /nobreak>nul
goto exit

:exit
exit
