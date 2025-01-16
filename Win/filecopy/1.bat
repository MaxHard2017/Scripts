@echo off
rem COPYIT.BAT transfers all files in all subdirectories of
rem the source drive or directory (%1) to the destination
rem drive or directory (%2)
rem xcopy %1 %2 /s /e

set dir_from="%USERPROFILE%\test\"
set dir_to="%USERPROFILE%\test\1\"
set source_file1="c.txt"
set source_file2="c.txt"


xcopy %dir_to% /Y /l > filelist.txt
@FOR /F %%x IN ('findstr /c:\ filelist.txt') DO xcopy /Y /f %dir_from%%source_file1% %%x
@FOR /F %%x IN ('findstr /c:\ filelist.txt') DO xcopy /Y /f %dir_from%%source_file2% %%x


rem error handling
if errorlevel 4 goto lowmemory
if errorlevel 2 goto abort
if errorlevel 0 goto exit
:lowmemory
echo Insufficient memory to copy files or
echo invalid drive or command-line syntax.
goto exit
:abort
echo You pressed CTRL+C to end the copy operation.
goto exit
:exit