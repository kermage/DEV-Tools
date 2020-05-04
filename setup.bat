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
IF NOT EXIST "Downloads\%sublime_fn%" (
	ECHO|SET /P ="Downloading Sublime Text . . . "
	cscript "scripts\download.vbs" "%sublime_url%" "Downloads" 2>NUL >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)
ECHO.

:: Install then import config and data
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

:: Configure Powershell
ECHO|SET /P ="Execution Policy . . . "
PowerShell.exe "Set-ExecutionPolicy RemoteSigned -scope CurrentUser" 2>NUL >NUL
ECHO DONE^^!

:: Install Scoop
ECHO|SET /P ="Installing Scoop . . . "
PowerShell.exe -Command "iwr -useb get.scoop.sh | iex" 2>NUL >NUL
ECHO DONE^^!

SET "PATH=%USERPROFILE%\scoop\shims;%PATH%"

:: Download Apps
ECHO|SET /P ="Downloading Apps . . . "
PowerShell.exe -Command "scoop install aria2 cmder git" 2>NUL >NUL
ECHO DONE^^!

CALL "scripts\import_cmder.bat" 2>NUL >NUL

:: Create ssh key folder if not exist
IF NOT EXIST "%USERPROFILE%\.ssh\" (
	MKDIR "%USERPROFILE%\.ssh" && ECHO Created "%USERPROFILE%\.ssh"
)

EXPLORER "%USERPROFILE%\.ssh"
ECHO.

PAUSE
EXIT
