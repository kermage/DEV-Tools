@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "scoop-data\" GOTO :END
ROBOCOPY "scoop-data\cmder" "%SCOOP%\persist\cmder\config" /S /NS /NC /NJH /NJS
COPY "scoop-data\cmder\user-ConEmu.xml" "%SCOOP%\persist\cmder\vendor\conemu-maximus5\ConEmu.xml"
ROBOCOPY "scoop-data\composer" "%SCOOP%\persist\composer\home" composer.* /S /NS /NC /NJH /NJS
ROBOCOPY "scoop-data\php" "%SCOOP%\persist\php\cli" /S /NS /NC /NJH /NJS
POWERSHELL -Command "( gc %SCOOP%\persist\php\cli\php.ini ) -replace ';curl.cainfo=', 'curl.cainfo=%SCOOP%\persist\php\cli\cacert.pem' | Out-File -encoding UTF8 %SCOOP%\persist\php\cli\php.ini"
POWERSHELL -Command "( gc %SCOOP%\persist\php\cli\php.ini ) -replace ';openssl.cafile=', 'openssl.cafile=%SCOOP%\persist\php\cli\cacert.pem' | Out-File -encoding UTF8 %SCOOP%\persist\php\cli\php.ini"
ROBOCOPY "scoop-data\sublime-text\settings" "%SCOOP%\persist\sublime-text\Data\Packages\User" /S /NS /NC /NJH /NJS
ROBOCOPY "scoop-data\sublime-text\snippets" "%SCOOP%\persist\sublime-text\Data\Packages\User\Snippets" /S /NS /NC /NJH /NJS
GOTO:EOF

:END