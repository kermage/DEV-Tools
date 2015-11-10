@ECHO OFF &MODE CON: COLS=45 LINES=2
TITLE Setup DEV-Tools

:: Download tools
cscript "download.vbs" "http://github.com/cmderdev/cmder/releases/download/v1.2.9/cmder_mini.zip"
cscript "download.vbs" "http://c758482.r82.cf2.rackcdn.com/Sublime Text Build 3083 Setup.exe"
cscript "download.vbs" "https://github.com/git-for-windows/git/releases/download/v2.6.2.windows.1/Git-2.6.2-32-bit.exe"

:: Install then import config and data
7za x "cmder_mini.zip" -o"%SYSTEMDRIVE%\Cmder"
CALL "import_cmder.bat"
"Sublime Text Build 3083 Setup.exe" /SILENT
CALL "import_sublime.bat"
"Git-2.6.2-32-bit.exe" /SILENT
CALL "git_config.bat"

:: Register Cmder context menu
%SYSTEMDRIVE%\Cmder\Cmder /REGISTER ALL

:: Create ssh key folder if not exist
IF NOT EXIST "%USERPROFILE%\.ssh\" MKDIR "%USERPROFILE%\.ssh"

PAUSE
EXIT
