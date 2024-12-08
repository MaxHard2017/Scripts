# This bat script is for launching PowerShell scripts (.ps1) bypassing restrictions
# for launching ps1 scripts and elevating execution priviliges
#
# PowerShell Elevation
# Elevation refers to the process of granting higher privileges to a user, thereby
# allowing access to system-critical functions. To elevate a PowerShell script to 
# run with administrator privileges call PowerShell, then start new process 
# [Start-Process] passing argument list and verb parameters:
#
# `-NoProfile`: This option prevents PowerShell from loading user profiles, speeding
# up the startup time.
# `-ExecutionPolicy Bypass`: This setting allows the script to run regardless of the
# current execution policy.
# `-File "C:\path\to\script.ps1 | %1 "`: Here, you specify the path to your script 
# that needs to be executed with administrative privileges or pass it as a first 
# parameter to 'ps1_launch.bat` script.


PowerShell "Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File "%1"' -Verb RunAs"