@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "scoop-data\" GOTO :END
ROBOCOPY "scoop-data\cmder" "%SCOOP%\persist\cmder\config" /S /NS /NC /NJH /NJS
COPY "scoop-data\cmder\user-ConEmu.xml" "%SCOOP%\persist\cmder\vendor\conemu-maximus5\ConEmu.xml"
ROBOCOPY "scoop-data\sublime-text\settings" "%SCOOP%\persist\sublime-text\Data\Packages\User" /S /NS /NC /NJH /NJS
ROBOCOPY "scoop-data\sublime-text\snippets" "%SCOOP%\persist\sublime-text\Data\Packages\User\Snippets" /S /NS /NC /NJH /NJS
GOTO:EOF

:END
