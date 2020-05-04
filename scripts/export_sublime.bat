@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%USERPROFILE%\scoop\persist\sublime-text\Data\Packages\User" GOTO :END
ROBOCOPY "%USERPROFILE%\scoop\persist\sublime-text\Data\Packages\User" "..\Sublime Text 3-data\Settings" *.sublime-settings *.sublime-keymap
ROBOCOPY "%USERPROFILE%\scoop\persist\sublime-text\Data\Packages\User\Snippets" "..\Sublime Text 3-data\Snippets" *.sublime-snippet
GOTO:EOF

:END
PAUSE
