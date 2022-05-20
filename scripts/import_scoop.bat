@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "scoop-data\" GOTO :END
ROBOCOPY "scoop-data\composer" "%SCOOP%\persist\composer\home" composer.* /S /NS /NC /NJH /NJS
ROBOCOPY "scoop-data\php" "%SCOOP%\persist\php\cli" /S /NS /NC /NJH /NJS
POWERSHELL -Command "( gc %SCOOP%\persist\php\cli\php.ini ) -replace ';curl.cainfo=', 'curl.cainfo=%SCOOP%\apps\cacert\current\cacert.pem' | Out-File -encoding ASCII %SCOOP%\persist\php\cli\php.ini"
POWERSHELL -Command "( gc %SCOOP%\persist\php\cli\php.ini ) -replace ';openssl.cafile=', 'openssl.cafile=%SCOOP%\apps\cacert\current\cacert.pem' | Out-File -encoding ASCII %SCOOP%\persist\php\cli\php.ini"
ROBOCOPY "scoop-data\php74" "%SCOOP%\persist\php74\cli" /S /NS /NC /NJH /NJS
POWERSHELL -Command "( gc %SCOOP%\persist\php74\cli\php.ini ) -replace ';curl.cainfo=', 'curl.cainfo=%SCOOP%\apps\cacert\current\cacert.pem' | Out-File -encoding ASCII %SCOOP%\persist\php74\cli\php.ini"
POWERSHELL -Command "( gc %SCOOP%\persist\php74\cli\php.ini ) -replace ';openssl.cafile=', 'openssl.cafile=%SCOOP%\apps\cacert\current\cacert.pem' | Out-File -encoding ASCII %SCOOP%\persist\php74\cli\php.ini"
GOTO:EOF

:END
