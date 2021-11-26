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

IF ["%~1"]==[""] (
	SET "SCOOP=%USERPROFILE%\scoop"
) else (
	SET "SCOOP=%~1"
)

SET "PATH=%SCOOP%\shims;%PATH%"

:: Configure Powershell
PowerShell.exe "Set-ExecutionPolicy RemoteSigned -scope CurrentUser"
ECHO.

:: Install Scoop
PowerShell.exe -Command "$env:SCOOP='%SCOOP%'; [environment]::setEnvironmentVariable( 'SCOOP', $env:SCOOP, 'User' ); iwr -useb get.scoop.sh | iex"
ECHO.

:: Download Apps
PowerShell.exe -Command "gc apps.txt | foreach-object { scoop install $_ }"
ECHO.
CALL CMD /C "scoop bucket add extras && scoop bucket add versions && scoop install vscode php-xdebug php74 php74-xdebug"
ECHO.

ECHO|SET /P ="Register Context Menu . . . "
REG IMPORT "%SCOOP%\apps\vscode\current\vscode-install-context.reg"

:: Import data
CALL "scripts\import_scoop.bat"
ECHO.

:: Create ssh key folder if not exist
IF NOT EXIST "%USERPROFILE%\.ssh\" (
	MKDIR "%USERPROFILE%\.ssh" && ECHO Created "%USERPROFILE%\.ssh"
)

:: Import files
CALL "scripts\import_ssh.bat"
CALL "scripts\import_bash.bat"
COPY "gitconfig" "%USERPROFILE%\.gitconfig"

CALL CMD /C "git-bash & code"
ECHO.

PAUSE
EXIT
