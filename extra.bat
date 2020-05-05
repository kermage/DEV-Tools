
@ECHO OFF
SETLOCAL EnableDelayedExpansion

SET sources[0]=https://cdn1.evernote.com/win6/public/Evernote_6.24.2.8919.exe
SET sources[1]=https://cdn.localwp.com/releases-stable/5.4.1+3311/local-5.4.1-windows.exe
SET index=0

:LOOP
IF NOT DEFINED sources[%index%] GOTO :END

SET source=!sources[%index%]!
FOR %%F IN ( "%source%" ) DO SET file_name=%%~nxF

CALL :DOWNLOAD "%file_name%" "%source%"
CALL :INSTALL "%file_name%"

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
	"Downloads\%1" /PASSIVE
	ECHO DONE^^!
)
GOTO:EOF

:END
PAUSE
