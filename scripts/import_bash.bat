@ECHO OFF

:COPYFILES
COPY "bash-files\.bash_profile" "%USERPROFILE%\.bash_profile"
:: Check if folder exist
IF NOT EXIST "bash-files\profile.d\" GOTO :END
ROBOCOPY "bash-files\profile.d" "%USERPROFILE%\profile.d" /S /NS /NC /NJH /NJS
GOTO:EOF

:END
