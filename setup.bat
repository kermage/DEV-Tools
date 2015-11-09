@ECHO OFF &MODE CON: COLS=45 LINES=2
TITLE Setup DEV-Tools

:: Import config and data
CALL "import_cmder.bat"
CALL "import_sublime.bat"
CALL "git_config.bat"

:: Register Cmder context menu
%SYSTEMDRIVE%\Cmder\Cmder /REGISTER ALL

:: Create ssh key folder if not exist
IF NOT EXIST "%USERPROFILE%\.ssh\" MKDIR "%USERPROFILE%\.ssh"

PAUSE
EXIT
