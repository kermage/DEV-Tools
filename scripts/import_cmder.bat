@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "Cmder-config\" GOTO :END
ROBOCOPY "Cmder-config" "%SYSTEMDRIVE%\Cmder" /S
GOTO:EOF

:END
PAUSE
