@ECHO OFF
SETLOCAL EnableDelayedExpansion

:DOWNLOAD
IF NOT EXIST "Downloads\sublime-settings.zip" (
	ECHO|SET /P ="Downloading Sublime settings . . . "
	cscript "scripts\download.vbs" "https://github.com/kermage/sublime-settings/archive/master.zip" "Downloads" "sublime-settings.zip" >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)
IF NOT EXIST "Downloads\sublime-snippets.zip" (
	ECHO|SET /P ="Downloading Sublime snippets . . . "
	cscript "scripts\download.vbs" "https://github.com/kermage/sublime-snippets/archive/master.zip" "Downloads" "sublime-snippets.zip" >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)

:COPYFILES
:: Check if zip exist
IF NOT EXIST "Downloads\sublime-settings.zip" GOTO :END
ECHO|SET /P ="Importing Sublime settings . . . "
7z e "Downloads\sublime-settings.zip" -o"%SCOOP%\persist\sublime-text\Data\Packages\User" -y >NUL
IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
RMDIR /Q "%SCOOP%\persist\sublime-text\Data\Packages\User\sublime-settings-master"
:: Check if zip exist
IF NOT EXIST "Downloads\sublime-snippets.zip" GOTO :END
ECHO|SET /P ="Importing Sublime snippets . . . "
7z e "Downloads\sublime-snippets.zip" -o"%SCOOP%\persist\sublime-text\Data\Packages\User\Snippets" -y >NUL
IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
RMDIR /Q "%SCOOP%\persist\sublime-text\Data\Packages\User\Snippets\sublime-snippets-master"
GOTO:EOF

:END
