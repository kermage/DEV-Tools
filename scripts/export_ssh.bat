@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%USERPROFILE%\.ssh\" GOTO :END
ROBOCOPY "%USERPROFILE%\.ssh" "..\ssh-files" /S /XF "known_hosts"
GOTO:EOF

:END
PAUSE
