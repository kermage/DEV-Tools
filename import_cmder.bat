@ECHO OFF
SET CMDER=Cmder

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%CMDER%-config\" GOTO :END
ROBOCOPY "%CMDER%-config" "%SYSTEMDRIVE%\%CMDER%" /S
COPY "%SYSTEMDRIVE%\%CMDER%\config\ConEmu.xml" "%SYSTEMDRIVE%\%CMDER%\vendor\conemu-maximus5\ConEmu.xml"
GOTO:EOF

:END
PAUSE
