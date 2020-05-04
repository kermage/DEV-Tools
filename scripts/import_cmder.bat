@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "Cmder-config\" GOTO :END
ROBOCOPY "Cmder-config" "%USERPROFILE%\scoop\persist\cmder\config" /S
GOTO:EOF

:END
