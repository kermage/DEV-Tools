@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "ssh-files\" GOTO :END
ROBOCOPY "ssh-files" "%USERPROFILE%\.ssh" /S /NS /NC /NJH /NJS
GOTO:EOF

:END
EXPLORER "%USERPROFILE%\.ssh"
