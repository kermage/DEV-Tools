@ECHO OFF

SET ALIASES=%CMDER_ROOT%\config\aliases

:: Check if documents alias already set
FOR /F "tokens=3 delims= " %%A IN ('TYPE %ALIASES% ^| FINDSTR /C:"dc="') DO SET documents_path=%%A
IF "%documents_path%"=="" (
	:: Find and set current user documents
	FOR /F "tokens=3 delims= " %%G IN ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /s ^| FINDSTR /C:"Documents"') DO CALL alias dc=cd /d "%%G"
)

:: Check if downloads alias already set
FOR /F "tokens=3 delims= " %%A IN ('TYPE %ALIASES% ^| FINDSTR /C:"dl="') DO SET downloads_path=%%A
IF "%downloads_path%"=="" (
	:: Find and set current user downloads
	FOR /F "tokens=3 delims= " %%G IN ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /s ^| FINDSTR /C:"Downloads"') DO CALL alias dl=cd /d "%%G"
)

:: Check if desktop alias already set
FOR /F "tokens=3 delims= " %%A IN ('TYPE %ALIASES% ^| FINDSTR /C:"dt="') DO SET desktop_path=%%A
IF "%desktop_path%"=="" (
	:: Find and set current user desktop
	FOR /F "tokens=3 delims= " %%G IN ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /s ^| FINDSTR /C:"Desktop"') DO CALL alias dt=cd /d "%%G"
)

:END
