@ECHO OFF

FOR %%I IN ( "%~dp0\..\.." ) DO SET "DEV_TOOLS=%%~fI"
CALL SET DEV_TOOLS=%%DEV_TOOLS:\=/%%
CALL SET SCOOP_PATH=%%SCOOP:\=/%%
CALL SET DT_UNIX=/%%DEV_TOOLS::=%%

:COPYFILES
:: Check if folder exist
IF NOT EXIST "scoop-data\" GOTO :END
ROBOCOPY "scoop-data\composer" "%SCOOP%\persist\composer\home" composer.* /S /NS /NC /NJH /NJS
ROBOCOPY "scoop-data\php" "%SCOOP%\persist\php\cli" /S /NS /NC /NJH /NJS
POWERSHELL -Command "( gc %SCOOP%\persist\php\cli\php.ini ) -replace ';curl.cainfo=', 'curl.cainfo=%SCOOP%\persist\php\cli\cacert.pem' | Out-File -encoding ASCII %SCOOP%\persist\php\cli\php.ini"
POWERSHELL -Command "( gc %SCOOP%\persist\php\cli\php.ini ) -replace ';openssl.cafile=', 'openssl.cafile=%SCOOP%\persist\php\cli\cacert.pem' | Out-File -encoding ASCII %SCOOP%\persist\php\cli\php.ini"
ROBOCOPY "scoop-data\php" "%SCOOP%\persist\php74\cli" /S /NS /NC /NJH /NJS
POWERSHELL -Command "( gc %SCOOP%\persist\php74\cli\php.ini ) -replace ';curl.cainfo=', 'curl.cainfo=%SCOOP%\persist\php74\cli\cacert.pem' | Out-File -encoding ASCII %SCOOP%\persist\php74\cli\php.ini"
POWERSHELL -Command "( gc %SCOOP%\persist\php74\cli\php.ini ) -replace ';openssl.cafile=', 'openssl.cafile=%SCOOP%\persist\php74\cli\cacert.pem' | Out-File -encoding ASCII %SCOOP%\persist\php74\cli\php.ini"
ROBOCOPY "scoop-data\sublime-text\settings" "%SCOOP%\persist\sublime-text\Data\Packages\User" /S /NS /NC /NJH /NJS
POWERSHELL -Command "( gc %SCOOP%\persist\sublime-text\Data\Packages\User\LocalHistory.sublime-settings ) -replace '###DEV_TOOLS###', '%DEV_TOOLS%' | Out-File -encoding ASCII %SCOOP%\persist\sublime-text\Data\Packages\User\LocalHistory.sublime-settings"
POWERSHELL -Command "( gc %SCOOP%\persist\sublime-text\Data\Packages\User\Terminal.sublime-settings ) -replace '###SCOOP###', '%SCOOP_PATH%' | Out-File -encoding ASCII %SCOOP%\persist\sublime-text\Data\Packages\User\Terminal.sublime-settings"
ROBOCOPY "scoop-data\sublime-text\snippets" "%SCOOP%\persist\sublime-text\Data\Packages\User\Snippets" /S /NS /NC /NJH /NJS
GOTO:EOF

:END
