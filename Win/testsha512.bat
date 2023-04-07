@ECHO OFF
if "%~1"=="/?" goto:HELP
if "%~1"=="" goto:HELP
:SHA
	@echo off
	CertUtil -hashfile %1 SHA512 > test.sha
	@echo Delete all in test.sha except sha, then . . .
	pause
	fc test.sha %2
GOTO:EOF

:HELP
	CLS
	echo Usage: testsha512.bat ^<test file^> ^<file with sha512^>
	echo 		^<test file^> - file for testing its SHA512 sum
	echo 		^<file with sha512^> - file with  SHA512 sum of the ^<test file^> for compare
	@echo.
	@echo.
	echo Checksum will be calculated and saved in test.sha file in yuor current directory
	echo You must modify test.sha deleting all unnecessary  info 
	echo except sha sum itself and then save it and press any key in terminal.
	echo Then ^<test file^> will be compared with given ^<file with sha512^>
	echo If differences are not found, then sha summ  of the ^<test file^>
	echo equals to given in ^<file with sha512^> - all is OK!
	@echo.