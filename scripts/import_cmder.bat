@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "Cmder-config\" GOTO :END
ROBOCOPY "Cmder-config" "%USERPROFILE%\scoop\persist\cmder\config" /S
COPY "Cmder-config\user-ConEmu.xml" "%USERPROFILE%\scoop\persist\cmder\vendor\conemu-maximus5\ConEmu.xml"
GOTO:EOF

:END
