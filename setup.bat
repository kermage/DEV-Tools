@ECHO OFF
TITLE Setup DEV-Tools
SETLOCAL EnableDelayedExpansion

:: Check admin permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
IF "%ERRORLEVEL%"=="0" ( GOTO :MAIN )

ECHO Set UAC = CreateObject^( "Shell.Application" ^) > "%TEMP%\getadmin.vbs"
ECHO UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%TEMP%\getadmin.vbs"
"%TEMP%\getadmin.vbs"
DEL "%TEMP%\getadmin.vbs"
EXIT /B

:MAIN
:: Change to batch file's directory
CD /D %~dp0

:: Banner
ECHO.
ECHO    *******    ******** **      **     **********                   **         
ECHO   /**////**  /**///// /**     /**    /////**///                   /**         
ECHO   /**    /** /**      /**     /**        /**    ******    ******  /**   ******
ECHO   /**    /** /******* //**    **  *****  /**   **////**  **////** /**  **//// 
ECHO   /**    /** /**////   //**  **  /////   /**  /**   /** /**   /** /** //***** 
ECHO   /**    **  /**        //****           /**  /**   /** /**   /** /**  /////**
ECHO   /*******   /********   //**            /**  //******  //******  ***  ****** 
ECHO   ///////    ////////     //             //    //////    //////  ///  //////  
ECHO.

:: Download tools
IF NOT EXIST "Downloads\cmder_mini.zip" (
	ECHO|SET /P ="Downloading Cmder . . . "
	cscript "download.vbs" "https://github.com/cmderdev/cmder/releases/download/v1.3.2/cmder_mini.zip" "Downloads" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)
IF NOT EXIST "Downloads\Sublime Text Build 3126 Setup.exe" (
	ECHO|SET /P ="Downloading Sublime Text . . . "
	cscript "download.vbs" "https://download.sublimetext.com/Sublime Text Build 3126 Setup.exe" "Downloads" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)
IF NOT EXIST "Downloads\Git-2.11.0.3-32-bit.exe" (
	ECHO|SET /P ="Downloading Git . . . "
	cscript "download.vbs" "https://github.com/git-for-windows/git/releases/download/v2.11.0.windows.3/Git-2.11.0.3-32-bit.exe" "Downloads" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)
IF NOT EXIST "Downloads\node-v6.9.4-x86.msi" (
	ECHO|SET /P ="Downloading NodeJS . . . "
	cscript "download.vbs" "https://nodejs.org/dist/v6.9.4/node-v6.9.4-x86.msi" "Downloads" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)
ECHO.

:: Install then import config and data
IF EXIST "Downloads\cmder_mini.zip" (
	ECHO|SET /P ="Installing Cmder . . . "
	7za x "Downloads\cmder_mini.zip" -o"%SYSTEMDRIVE%\Cmder" -y 2>NUL >NUL
	CALL "import_cmder.bat" 2>NUL >NUL
	:: Register Cmder context menu
	%SYSTEMDRIVE%\Cmder\Cmder /REGISTER ALL
	ECHO DONE^^!
)
IF EXIST "Downloads\Sublime Text Build 3126 Setup.exe" (
	ECHO|SET /P ="Installing Sublime Text . . . "
	"Downloads\Sublime Text Build 3126 Setup.exe" /SILENT /LOADINF="Downloads\sublime.ini"
	CALL "import_sublime.bat" 2>NUL >NUL
	:: Install Package Control
	cscript "download.vbs" "https://packagecontrol.io/Package Control.sublime-package" "%APPDATA%\Sublime Text 3\Installed Packages" 2>NUL >NUL
	ECHO DONE^^!
)
IF EXIST "Downloads\Git-2.11.0.3-32-bit.exe" (
	ECHO|SET /P ="Installing Git . . . "
	"Downloads\Git-2.11.0.3-32-bit.exe" /SILENT /LOADINF="Downloads\git.ini"
	ECHO DONE^^!
	START CMD /C "git_config.bat"
)
IF EXIST "Downloads\node-v6.9.4-x86.msi" (
	ECHO|SET /P ="Installing NodeJS . . . "
	"Downloads\node-v6.9.4-x86.msi" /QUIET
	ECHO DONE^^!
	START CMD /C "npm_install.bat"
)
ECHO.

:: Create ssh key folder if not exist
IF NOT EXIST "%USERPROFILE%\.ssh\" (
	MKDIR "%USERPROFILE%\.ssh" && ECHO Created "%USERPROFILE%\.ssh"
)
ECHO.

PAUSE
EXIT
