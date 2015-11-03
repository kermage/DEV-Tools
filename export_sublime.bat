@ECHO OFF
SET SUBLIME=Sublime Text 3

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%APPDATA%\%SUBLIME%" GOTO :END
REM 7za a -t7z -mx9 "%SUBLIME%"-data.7z "%APPDATA%\%SUBLIME%\Packages\User\*.*" "%APPDATA%\%SUBLIME%\Packages\User\Snippets" "-x!Package Control.cache" "-x!Package Control.last-run"
ROBOCOPY "%APPDATA%\%SUBLIME%\Packages\User" "%SUBLIME%"-data\Packages\User /S /XF "Package Control.last-run" /XD "Color Highlighter" "Package Control.cache"
GOTO:EOF

:END
PAUSE
