@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%SCOOP%\persist\sublime-text\Data\Packages\User" GOTO :END
ROBOCOPY "%SCOOP%\persist\sublime-text\Data\Packages\User" "..\Sublime Text 3-data\Settings" *.sublime-settings *.sublime-keymap
ROBOCOPY "%SCOOP%\persist\sublime-text\Data\Packages\User\Snippets" "..\Sublime Text 3-data\Snippets" *.sublime-snippet

:END
PAUSE
