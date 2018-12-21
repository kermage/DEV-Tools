@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%SYSTEMDRIVE%\Cmder\" GOTO :END
ROBOCOPY "%SYSTEMDRIVE%\Cmder\bin" "..\Cmder-config\bin" /S /XF "alias.bat" "Readme.md"
ROBOCOPY "%SYSTEMDRIVE%\Cmder\config" "..\Cmder-config\config" /S /XF ".history" "ConEmu.xml" "Readme.md"
GOTO:EOF

:END
PAUSE
