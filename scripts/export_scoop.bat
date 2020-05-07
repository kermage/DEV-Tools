@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%SCOOP%\persist\" GOTO :END
ROBOCOPY "%SCOOP%\persist\cmder\config" "..\scoop-data\cmder" /S /XF ".history" "Readme.md"
ROBOCOPY "%SCOOP%\persist\composer\home" "..\scoop-data\composer" *.json keys.*
ROBOCOPY "%SCOOP%\persist\php\cli" "..\scoop-data\php" /S
ROBOCOPY "%SCOOP%\persist\sublime-text\Data\Packages\User" "..\scoop-data\sublime-text\settings" *.sublime-settings *.sublime-keymap
ROBOCOPY "%SCOOP%\persist\sublime-text\Data\Packages\User\Snippets" "..\scoop-data\sublime-text\snippets" *.sublime-snippet

:END
PAUSE
