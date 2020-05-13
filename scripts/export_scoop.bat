@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%SCOOP%\persist\" GOTO :END
ROBOCOPY "%SCOOP%\persist\cmder\config" "..\scoop-data\cmder" /S /XF ".history" "Readme.md"
POWERSHELL -Command "( gc ..\scoop-data\cmder\user_profile.sh ) -replace '.+/automate-them-all/gatas.sh', '###DEV_TOOLS###/automate-them-all/gatas.sh' | Out-File -encoding UTF8 ..\scoop-data\cmder\user_profile.sh"
ROBOCOPY "%SCOOP%\persist\composer\home" "..\scoop-data\composer" *.json keys.*
ROBOCOPY "%SCOOP%\persist\php\cli" "..\scoop-data\php" /S
POWERSHELL -Command "( gc ..\scoop-data\php\php.ini ) -replace 'curl.cainfo=.+', ';curl.cainfo=' | Out-File -encoding UTF8 ..\scoop-data\php\php.ini"
POWERSHELL -Command "( gc ..\scoop-data\php\php.ini ) -replace 'openssl.cafile=.+', ';openssl.cafile=' | Out-File -encoding UTF8 ..\scoop-data\php\php.ini"
ROBOCOPY "%SCOOP%\persist\sublime-text\Data\Packages\User" "..\scoop-data\sublime-text\settings" *.sublime-settings *.sublime-keymap
POWERSHELL -Command "( gc ..\scoop-data\sublime-text\settings\LocalHistory.sublime-settings ) -replace ': "".+/Sublime Text Backups', ': """"###DEV_TOOLS###/Sublime Text Backups' | Out-File -encoding UTF8 ..\scoop-data\sublime-text\settings\LocalHistory.sublime-settings"
ROBOCOPY "%SCOOP%\persist\sublime-text\Data\Packages\User\Snippets" "..\scoop-data\sublime-text\snippets" *.sublime-snippet

:END
PAUSE
