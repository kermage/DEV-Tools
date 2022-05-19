@ECHO OFF

:COPYFILES
COPY "bash-files\.bash_profile" "%USERPROFILE%\.bash_profile"
:: Check if profile.d exist
IF EXIST "bash-files\profile.d\" (
	ROBOCOPY "bash-files\profile.d" "%USERPROFILE%\profile.d" /S /NS /NC /NJH /NJS
)
:: Check if bin exist
IF EXIST "bash-files\bin\" (
	ROBOCOPY "bash-files\bin" "%USERPROFILE%\bin" /S /NS /NC /NJH /NJS
)
GOTO:EOF

:END
