@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "Cmder-config\" GOTO :END
ROBOCOPY "Cmder-config" "%SYSTEMDRIVE%\Cmder\config" /S
GOTO:EOF

:END
