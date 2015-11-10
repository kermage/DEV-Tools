@ECHO OFF
TITLE Setup DEV-Tools

:: Download tools
ECHO Downloading Cmder . . .
cscript "download.vbs" "http://github.com/cmderdev/cmder/releases/download/v1.2.9/cmder_mini.zip" 2>NUL >NUL
ECHO Downloading Sublime . . .
cscript "download.vbs" "http://c758482.r82.cf2.rackcdn.com/Sublime Text Build 3083 Setup.exe" 2>NUL >NUL
ECHO Downloading Git . . .
cscript "download.vbs" "https://github.com/git-for-windows/git/releases/download/v2.6.2.windows.1/Git-2.6.2-32-bit.exe" 2>NUL >NUL

:: Install then import config and data
IF EXIST "cmder_mini.zip" (
	ECHO Installing Cmder . . .
	7za x "cmder_mini.zip" -o"%SYSTEMDRIVE%\Cmder" -y 2>NUL >NUL
	:: Register Cmder context menu
	%SYSTEMDRIVE%\Cmder\Cmder /REGISTER ALL
	CALL "import_cmder.bat" 2>NUL >NUL
)
IF EXIST "Sublime Text Build 3083 Setup.exe" (
	ECHO Installing Sublime . . .
	"Sublime Text Build 3083 Setup.exe" /SILENT
	CALL "import_sublime.bat" 2>NUL >NUL
)
IF EXIST "Git-2.6.2-32-bit.exe" (
	ECHO Installing Git . . .
	"Git-2.6.2-32-bit.exe" /SILENT
	CALL "git_config.bat"
)

:: Create ssh key folder if not exist
IF NOT EXIST "%USERPROFILE%\.ssh\" (
	MKDIR "%USERPROFILE%\.ssh" && ECHO Created "%USERPROFILE%\.ssh"
)

PAUSE
EXIT
