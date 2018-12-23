@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%SYSTEMDRIVE%\Cmder\" GOTO :END
ROBOCOPY "%SYSTEMDRIVE%\Cmder\config" "..\Cmder-config" /S /XF ".history" "Readme.md"
GOTO:EOF

:END
PAUSE
