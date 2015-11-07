@ECHO OFF
SET SUBLIME=Sublime Text 3

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%APPDATA%\%SUBLIME%\" GOTO :END
ROBOCOPY "%APPDATA%\%SUBLIME%\Packages\User" "%SUBLIME%-data\Packages\User" /S /XF "Package Control.last-run" /XD "Color Highlighter" "Package Control.cache"
GOTO:EOF

:END
PAUSE
