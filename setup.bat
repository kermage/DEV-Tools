@ECHO OFF
TITLE Setup DEV-Tools

:: Download tools
ECHO Downloading Cmder . . .
cscript "download.vbs" "http://github.com/cmderdev/cmder/releases/download/v1.2.9/cmder_mini.zip"
ECHO Downloading Sublime . . .
cscript "download.vbs" "http://c758482.r82.cf2.rackcdn.com/Sublime Text Build 3083 Setup.exe"
ECHO Downloading Git . . .
cscript "download.vbs" "https://github.com/git-for-windows/git/releases/download/v2.6.2.windows.1/Git-2.6.2-32-bit.exe"

:: Install then import config and data
ECHO Installing Cmder . . .
7za x "cmder_mini.zip" -o"%SYSTEMDRIVE%\Cmder" -y
CALL "import_cmder.bat"
ECHO Installing Sublime . . .
"Sublime Text Build 3083 Setup.exe" /SILENT
CALL "import_sublime.bat"
ECHO Installing Git . . .
"Git-2.6.2-32-bit.exe" /SILENT
CALL "git_config.bat"

:: Register Cmder context menu
%SYSTEMDRIVE%\Cmder\Cmder /REGISTER ALL

:: Create ssh key folder if not exist
IF NOT EXIST "%USERPROFILE%\.ssh\" (
	MKDIR "%USERPROFILE%\.ssh" && ECHO Created "%USERPROFILE%\.ssh"
)

PAUSE
EXIT
