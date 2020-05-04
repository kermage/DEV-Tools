@ECHO OFF
SETLOCAL EnableDelayedExpansion

:DOWNLOAD
IF NOT EXIST "Downloads\sublime-settings.zip" (
	ECHO|SET /P ="Downloading Sublime settings . . . "
	cscript "scripts\download.vbs" "https://github.com/kermage/sublime-settings/archive/master.zip" "Downloads" "sublime-settings.zip" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)
IF NOT EXIST "Downloads\sublime-snippets.zip" (
	ECHO|SET /P ="Downloading Sublime snippets . . . "
	cscript "scripts\download.vbs" "https://github.com/kermage/sublime-snippets/archive/master.zip" "Downloads" "sublime-snippets.zip" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)

:COPYFILES
:: Check if zip exist
IF NOT EXIST "Downloads\sublime-settings.zip" GOTO :END
7za e "Downloads\sublime-settings.zip" -o"%USERPROFILE%\scoop\persist\sublime-text\Data\Packages\User" -y
RMDIR /Q "%USERPROFILE%\scoop\persist\sublime-text\Data\Packages\User\sublime-settings-master"
:: Check if zip exist
IF NOT EXIST "Downloads\sublime-snippets.zip" GOTO :END
7za e "Downloads\sublime-snippets.zip" -o"%USERPROFILE%\scoop\persist\sublime-text\Data\Packages\User\Snippets" -y
RMDIR /Q "%USERPROFILE%\scoop\persist\sublime-text\Data\Packages\User\Snippets\sublime-snippets-master"
GOTO:EOF

:END
