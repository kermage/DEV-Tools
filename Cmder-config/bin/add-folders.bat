@ECHO OFF

:: Find and set current user shell folders
FOR /F "tokens=3 delims= " %%G IN ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /s ^| FINDSTR /C:"Documents"') DO CALL alias dc=cd /d "%%G"
FOR /F "tokens=3 delims= " %%G IN ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /s ^| FINDSTR /C:"Downloads"') DO CALL alias dl=cd /d "%%G"
FOR /F "tokens=3 delims= " %%G IN ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /s ^| FINDSTR /C:"Desktop"') DO CALL alias dt=cd /d "%%G"

:END
