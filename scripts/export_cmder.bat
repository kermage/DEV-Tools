@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%USERPROFILE%\scoop\persist\cmder\" GOTO :END
ROBOCOPY "%USERPROFILE%\scoop\persist\cmder\config" "..\Cmder-config" /S /XF ".history" "Readme.md"
GOTO:EOF

:END
PAUSE
