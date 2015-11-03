@ECHO OFF
SET SUBLIME=Sublime Text 3

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%SUBLIME%"-data GOTO :END
REM 7za x "%SUBLIME%"-data.7z -o"%APPDATA%\%SUBLIME%\Packages\User" -y
ROBOCOPY "%SUBLIME%"-data "%APPDATA%\%SUBLIME%\Packages\User" /S
GOTO:EOF

:END
PAUSE
