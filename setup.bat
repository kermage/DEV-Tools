@ECHO OFF
TITLE Setup DEV-Tools

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
ECHO.

ECHO|SET /P ="Register Context Menu . . . "
%USERPROFILE%\scoop\apps\cmder\current\Cmder /register USER
REG IMPORT "%USERPROFILE%\scoop\apps\sublime-text\current\install-context.reg"

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
CALL CMD /C "cmder && subl"
ECHO.

PAUSE
EXIT
