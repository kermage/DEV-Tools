@ECHO OFF
SETLOCAL EnableDelayedExpansion

:DOWNLOAD
IF NOT EXIST "Downloads\sublime-settings.zip" (
	ECHO|SET /P ="Downloading Sublime settings . . . "
	cscript "download.vbs" "https://github.com/kermage/sublime-settings/archive/master.zip" "Downloads" "sublime-settings.zip" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)
IF NOT EXIST "Downloads\sublime-snippets.zip" (
	ECHO|SET /P ="Downloading Sublime snippets . . . "
	cscript "download.vbs" "https://github.com/kermage/sublime-snippets/archive/master.zip" "Downloads" "sublime-snippets.zip" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)

:COPYFILES
:: Check if zip exist
IF NOT EXIST "Downloads\sublime-settings.zip" GOTO :END
7za e "Downloads\sublime-settings.zip" -o"%APPDATA%Sublime Text 3\Packages\User" -y 2>NUL >NUL
RMDIR /Q "%APPDATA%Sublime Text 3\Packages\User\sublime-settings-master"
:: Check if zip exist
IF NOT EXIST "Downloads\sublime-snippets.zip" GOTO :END
7za e "Downloads\sublime-snippets.zip" -o"%APPDATA%Sublime Text 3\Packages\User\Snippets" -y 2>NUL >NUL
RMDIR /Q "%APPDATA%Sublime Text 3\Packages\User\Snippets\sublime-snippets-master"
GOTO:EOF

:END
PAUSE
