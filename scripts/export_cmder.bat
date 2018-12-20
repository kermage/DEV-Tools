@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%SYSTEMDRIVE%\cmder\" GOTO :END
ROBOCOPY "%SYSTEMDRIVE%\cmder\bin" "..\cmder-config\bin" /S /XF "alias.bat" "Readme.md"
ROBOCOPY "%SYSTEMDRIVE%\cmder\config" "..\cmder-config\config" /S /XF ".history" "ConEmu.xml" "Readme.md"
GOTO:EOF

:END
PAUSE
