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

:: Configure Powershell
PowerShell.exe "Set-ExecutionPolicy RemoteSigned -scope CurrentUser"
ECHO.

:: Install Scoop
PowerShell.exe -Command "iwr -useb get.scoop.sh | iex"
ECHO.

SET "PATH=%USERPROFILE%\scoop\shims;%PATH%"

:: Download Apps
PowerShell.exe -Command "gc apps.txt | foreach-object { scoop install $_ }"
ECHO.
CALL CMD /C "scoop bucket add extras && scoop install sublime-text"

:: Import config
CALL "scripts\import_cmder.bat"
ECHO.
CALL "scripts\import_sublime.bat"

:: Install Package Control
cscript "scripts\download.vbs" "https://packagecontrol.io/Package Control.sublime-package" "%USERPROFILE%\scoop\persist\sublime-text\Data\Installed Packages" >NUL

:: Create ssh key folder if not exist
IF NOT EXIST "%USERPROFILE%\.ssh\" (
	MKDIR "%USERPROFILE%\.ssh" && ECHO Created "%USERPROFILE%\.ssh"
)

EXPLORER "%USERPROFILE%\.ssh"
ECHO.

PAUSE
EXIT
