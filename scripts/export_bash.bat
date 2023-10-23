@ECHO OFF

:COPYFILES
COPY "%USERPROFILE%\.bash_profile" "..\bash-files\.bash_profile"
:: Check if .profile.d exist
IF EXIST "%USERPROFILE%\.profile.d\" (
	ROBOCOPY "%USERPROFILE%\.profile.d" "..\bash-files\.profile.d" /S
)
:: Check if bin exist
IF EXIST "%USERPROFILE%\bin\" (
	ROBOCOPY "%USERPROFILE%\bin" "..\bash-files\bin" /S
)

:END
PAUSE
