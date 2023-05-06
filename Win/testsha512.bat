@ECHO OFF
if "%~1"=="/?" goto:HELP
if "%~1"=="" goto:HELP

	@echo off
	CertUtil -hashfile %1 SHA512 > test.sha
	@echo SHA512 calculated and saved in current working directory
	@echo.
	@echo Delete all in test.sha except sha summ for comparison!!!
	pause
	fc test.sha %2
GOTO:EOF

:HELP
	CLS
	echo Usage: testsha512.bat ^<test file^> ^<file with sha512^>
	echo 		^<test file^> - path to the file for calculating its SHA512 sum
	echo 		^<file with sha512^> - path to the file with given SHA512 sum of the ^<test file^> for compare
	echo		Could be created as a text file
	@echo.
	@echo.
	echo Checksum will be calculated and saved in test.sha file in yuor current directory
	echo You must modify test.sha deleting all unnecessary  info 
	echo except sha sum itself and then save it and press any key in terminal.
	echo Then ^<test file^> will be compared with given ^<file with sha512^>
	echo If differences are not found, then sha summ  of the ^<test file^>
	echo equals to given in ^<file with sha512^> - all is OK!
	@echo.