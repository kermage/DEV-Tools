@ECHO OFF

:: Find and set current user shell folders
FOR /F "tokens=3 delims= " %%G IN ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /s ^| FINDSTR /C:"Documents"') DO SET documents_path=%%G
IF NOT "%documents_path%"=="" CALL alias dc=cd /d "%documents_path%"
FOR /F "tokens=3 delims= " %%G IN ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /s ^| FINDSTR /C:"Downloads"') DO SET downloads_path=%%G
IF NOT "%downloads_path%"=="" CALL alias dl=cd /d "%downloads_path%"
FOR /F "tokens=3 delims= " %%G IN ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /s ^| FINDSTR /C:"Desktop"') DO SET desktop_path=%%G
IF NOT "%desktop_path%"=="" CALL alias dt=cd /d "%desktop_path%"

:END
