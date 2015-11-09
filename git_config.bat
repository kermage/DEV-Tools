@ECHO OFF
TITLE Git Configuration
SETLOCAL EnableDelayedExpansion

:: Check global git config; set if not found
FOR /F "delims=" %%* IN ('git config user.name') DO SET user_name=%%*
IF [!user_name!]==[] (
	SET /P user_name=Enter Username: %=%
	git config --global user.name !user_name!
)

FOR /F "delims=" %%* IN ('git config user.email') DO SET user_email=%%*
IF [!user_email!]==[] (
	SET /P user_email=Enter Email: %=%
	git config --global user.email !user_email!
)

FOR /F "delims=" %%* IN ('git config github.token') DO SET github_token=%%*
IF [!github_token!]==[] (
	SET /P github_token=GitHub Token: %=%
	git config --global github.token !github_token!
)
