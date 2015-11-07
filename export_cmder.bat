@ECHO OFF
SET CMDER=Cmder

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%SYSTEMDRIVE%\%CMDER%\" GOTO :END
COPY "%SYSTEMDRIVE%\%CMDER%\vendor\conemu-maximus5\ConEmu.xml" "%SYSTEMDRIVE%\%CMDER%\config\ConEmu.xml"
ROBOCOPY "%SYSTEMDRIVE%\%CMDER%\bin" "%CMDER%-config\bin" /S /XF "alias.bat" "Readme.md"
ROBOCOPY "%SYSTEMDRIVE%\%CMDER%\config" "%CMDER%-config\config" /S /XF ".history" "cmder.lua" "Readme.md"
GOTO:EOF

:END
PAUSE
