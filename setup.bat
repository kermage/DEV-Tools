@ECHO OFF
TITLE Setup DEV-Tools
SETLOCAL EnableDelayedExpansion

:: Download tools
IF NOT EXIST "Downloads\cmder_mini.zip" (
	ECHO|SET /P ="Downloading Cmder ... "
	cscript "download.vbs" "http://github.com/cmderdev/cmder/releases/download/v1.2.9/cmder_mini.zip" "Downloads" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^! ) ELSE ( ECHO FAILED^! )
)
IF NOT EXIST "Downloads\Sublime Text Build 3083 Setup.exe" (
	ECHO|SET /P ="Downloading Sublime ... "
	cscript "download.vbs" "http://c758482.r82.cf2.rackcdn.com/Sublime Text Build 3083 Setup.exe" "Downloads" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^! ) ELSE ( ECHO FAILED^! )
)
IF NOT EXIST "Downloads\Git-2.6.2-32-bit.exe" (
	ECHO|SET /P ="Downloading Git ... "
	cscript "download.vbs" "https://github.com/git-for-windows/git/releases/download/v2.6.2.windows.1/Git-2.6.2-32-bit.exe" "Downloads" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^! ) ELSE ( ECHO FAILED^! )
)

:: Install then import config and data
IF EXIST "Downloads\cmder_mini.zip" (
	ECHO|SET /P ="Installing Cmder ... "
	7za x "Downloads\cmder_mini.zip" -o"%SYSTEMDRIVE%\Cmder" -y 2>NUL >NUL
	:: Register Cmder context menu
	%SYSTEMDRIVE%\Cmder\Cmder /REGISTER ALL
	CALL "import_cmder.bat" 2>NUL >NUL
	ECHO DONE^!
)
IF EXIST "Downloads\Sublime Text Build 3083 Setup.exe" (
	ECHO|SET /P ="Installing Sublime ... "
	"Downloads\Sublime Text Build 3083 Setup.exe" /SILENT /TASKS="contextentry"
	CALL "import_sublime.bat" 2>NUL >NUL
	ECHO DONE^!
)
IF EXIST "Downloads\Git-2.6.2-32-bit.exe" (
	ECHO|SET /P ="Installing Git ... "
	"Downloads\Git-2.6.2-32-bit.exe" /SILENT
	ECHO DONE^!
	CALL "git_config.bat"
)

:: Create ssh key folder if not exist
IF NOT EXIST "%USERPROFILE%\.ssh\" (
	MKDIR "%USERPROFILE%\.ssh" && ECHO Created "%USERPROFILE%\.ssh"
)

PAUSE
EXIT
