@ECHO OFF

:COPYFILES
:: Check if folder exist
IF NOT EXIST "%SCOOP%\persist\" GOTO :END
ROBOCOPY "%SCOOP%\persist\composer\home" "..\scoop-data\composer" *.json keys.*
ROBOCOPY "%SCOOP%\persist\php\cli" "..\scoop-data\php" /S
POWERSHELL -Command "( gc ..\scoop-data\php\php.ini ) -replace 'curl.cainfo=.+', ';curl.cainfo=' | Out-File -encoding ASCII ..\scoop-data\php\php.ini"
POWERSHELL -Command "( gc ..\scoop-data\php\php.ini ) -replace 'openssl.cafile=.+', ';openssl.cafile=' | Out-File -encoding ASCII ..\scoop-data\php\php.ini"
ROBOCOPY "%SCOOP%\persist\php74\cli" "..\scoop-data\php74" /S
POWERSHELL -Command "( gc ..\scoop-data\php74\php.ini ) -replace 'curl.cainfo=.+', ';curl.cainfo=' | Out-File -encoding ASCII ..\scoop-data\php74\php.ini"
POWERSHELL -Command "( gc ..\scoop-data\php74\php.ini ) -replace 'openssl.cafile=.+', ';openssl.cafile=' | Out-File -encoding ASCII ..\scoop-data\php74\php.ini"

:END
PAUSE
