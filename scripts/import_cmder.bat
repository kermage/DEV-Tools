@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "Cmder-config\" GOTO :END
ROBOCOPY "Cmder-config" "%SCOOP%\persist\cmder\config" /S /NS /NC /NJH /NJS
COPY "Cmder-config\user-ConEmu.xml" "%SCOOP%\persist\cmder\vendor\conemu-maximus5\ConEmu.xml"
GOTO:EOF

:END
