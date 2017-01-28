@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "cmder-config\" GOTO :END
ROBOCOPY "cmder-config" "%SYSTEMDRIVE%\cmder" /S
GOTO:EOF

:END
PAUSE
