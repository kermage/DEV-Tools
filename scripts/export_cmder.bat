@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%SCOOP%\persist\cmder\" GOTO :END
ROBOCOPY "%SCOOP%\persist\cmder\config" "..\Cmder-config" /S /XF ".history" "Readme.md"
GOTO:EOF

:END
PAUSE
