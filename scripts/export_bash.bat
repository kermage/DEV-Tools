@ECHO OFF

:COPYFILES
COPY "%USERPROFILE%\.bash_profile" "..\bash-files\.bash_profile"
:: Check if folder exist
IF NOT EXIST "%USERPROFILE%\profile.d\" GOTO :END
ROBOCOPY "%USERPROFILE%\profile.d" "..\bash-files\profile.d" /S

:END
PAUSE
