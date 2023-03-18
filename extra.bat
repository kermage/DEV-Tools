@ECHO OFF
SETLOCAL EnableDelayedExpansion
TITLE Extra DEV-Tools

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

SET sources[0]=https://cdn1.evernote.com/boron/win/builds/Evernote-10.54.4-win-ddl-ga-3978-986a1704b8-setup.exe
SET sources[1]=https://cdn.localwp.com/releases-stable/6.7.0+6347/local-6.7.0-windows.exe
SET index=0

:LOOP
IF NOT DEFINED sources[%index%] GOTO :END

SET source=!sources[%index%]!
FOR %%F IN ( "%source%" ) DO SET file_name=%%~nxF

CALL :DOWNLOAD "%file_name%" "%source%"
CALL :INSTALL "%file_name%"
ECHO.

SET /A index+=1
GOTO :LOOP

:DOWNLOAD
IF NOT EXIST "Downloads\%1" (
	ECHO|SET /P ="Downloading %1 . . . "
	cscript "scripts\download.vbs" "%2" "Downloads" >NUL
	IF "!ERRORLEVEL!"=="0" ( ECHO DONE^^! ) ELSE ( ECHO FAILED^^! )
)
GOTO:EOF

:INSTALL
IF EXIST "Downloads\%1" (
	ECHO|SET /P ="Installing %1 . . . "
	CALL CMD /C "START Downloads\%1 /PASSIVE"
	ECHO DONE^^!
)
GOTO:EOF

:END
PAUSE
