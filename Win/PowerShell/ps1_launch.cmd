@echo off
REM This bat script is for launching PowerShell scripts (.ps1) bypassing restrictions
REM for launching ps1 scripts and elevating execution priviliges
REM
REM PowerShell Elevation
REM Elevation refers to the process of granting higher privileges to a user, thereby
REM allowing access to system-critical functions. To elevate a PowerShell script to 
REM run with administrator privileges call PowerShell, then start new process 
REM [Start-Process] passing argument list and verb parameters:
REM
REM `-NoProfile`: This option prevents PowerShell from loading user profiles, speeding
REM up the startup time.
REM `-ExecutionPolicy Bypass`: This setting allows the script to run regardless of the
REM current execution policy.
REM `-File "C:\path\to\script.ps1 | %1 "`: Here, you specify the path to your script 
REM that needs to be executed with administrative privileges or pass it as a first 
REM parameter to 'ps1_launch.bat` script.
REM `-Wait` - Indicates that this cmdlet waits for the specified process and its 
REM descendants to complete before accepting more input. This parameter suppresses 
REM the command prompt or retains the window until the processes finish.

REM script argument check
if [%1]==[] goto usage

start /b /wait cmd /c PowerShell "Start-Process PowerShell -Wait -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File "%1"' -Verb RunAs"
goto :eof

:usage
@echo PowerShell scripts execution bypassing restrictions and setting elevated privileges
@echo.
@echo      Usage: %~nx0 ^<path\to\PowerShell_file^>
@echo.
pause
exit /B 1