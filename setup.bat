@ECHO OFF &MODE CON: COLS=45 LINES=2
TITLE Setup DEV-Tools

CALL "import_cmder.bat"
CALL "import_sublime.bat"
CALL "git_config.bat"

:: Register Cmder context menu
%SYSTEMDRIVE%\Cmder\Cmder /REGISTER ALL

PAUSE
EXIT
