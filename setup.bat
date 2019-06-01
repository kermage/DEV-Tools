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

CALL "config.bat"

:: Download tools
IF NOT EXIST "Downloads\%cmder_fn%" (
	ECHO|SET /P ="Downloading Cmder . . . "
	cscript "scripts\download.vbs" "%cmder_url%" "Downloads" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)
IF NOT EXIST "Downloads\%sublime_fn%" (
	ECHO|SET /P ="Downloading Sublime Text . . . "
	cscript "scripts\download.vbs" "%sublime_url%" "Downloads" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)
ECHO.

:: Install then import config and data
IF EXIST "Downloads\%cmder_fn%" (
	ECHO|SET /P ="Installing Cmder . . . "
	7za x "Downloads\%cmder_fn%" -o"%SYSTEMDRIVE%\Cmder" -y 2>NUL >NUL
	CALL "scripts\import_cmder.bat" 2>NUL >NUL
	:: Register Cmder context menu
	%SYSTEMDRIVE%\Cmder\Cmder /REGISTER ALL
	ECHO DONE^^!
)
IF EXIST "Downloads\%sublime_fn%" (
	ECHO|SET /P ="Installing Sublime Text . . . "
	"Downloads\%sublime_fn%" /SILENT /LOADINF="Downloads\sublime.ini"
	CALL "scripts\import_sublime.bat" 2>NUL >NUL
	:: Install Package Control
	cscript "scripts\download.vbs" "https://packagecontrol.io/Package Control.sublime-package" "%APPDATA%\Sublime Text 3\Installed Packages" 2>NUL >NUL
	CALL "scripts\add-sublime.bat" 2>NUL >NUL
	ECHO DONE^^!
)
ECHO.

:: Install Scoop
START https://github.com/lukesampson/scoop
START powershell

:: Create ssh key folder if not exist
IF NOT EXIST "%USERPROFILE%\.ssh\" (
	MKDIR "%USERPROFILE%\.ssh" && ECHO Created "%USERPROFILE%\.ssh"
)

EXPLORER "%USERPROFILE%\.ssh"
ECHO.

PAUSE
EXIT
