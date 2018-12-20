@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%APPDATA%\Sublime Text 3\Packages\User" GOTO :END
ROBOCOPY "%APPDATA%\Sublime Text 3\Packages\User" "..\Sublime Text 3-data" *.sublime-settings *.sublime-keymap
ROBOCOPY "%APPDATA%\Sublime Text 3\Packages\User\Snippets" "..\Sublime Text 3-data\Snippets" *.sublime-snippet
GOTO:EOF

:END
PAUSE
