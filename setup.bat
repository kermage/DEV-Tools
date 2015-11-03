@ECHO OFF &MODE CON: COLS=45 LINES=2
TITLE Setup DevTools

CALL "import_cmder.bat"
CALL "import_sublime.bat"
%SYSTEMDRIVE%\Cmder\Cmder /REGISTER ALL

PAUSE
EXIT
