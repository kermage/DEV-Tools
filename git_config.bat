@ECHO OFF
TITLE Git Configuration
SETLOCAL EnableDelayedExpansion

:: Skip if git is recognized
git --version 2>NUL >NUL && GOTO :MAIN

:: Find Git path
IF EXIST "%ProgramFiles%\Git" (
	SET "git_path=%ProgramFiles%\Git"
) ELSE IF EXIST "%ProgramFiles(x86)%\Git" (
	SET "git_path=%ProgramFiles(x86)%\Git"
)

:: Skip if Git not found
IF [!git_path!]==[] GOTO :END

:: Add Git to path if not exist
ECHO "%PATH%" | FINDSTR /C:"%git_path%" 2>NUL >NUL || (
	SET "PATH=%git_path%\bin;%git_path%\usr\bin;%PATH%"
)

:MAIN
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

FOR /F "delims=" %%* IN ('git config bitbucket.token') DO SET bitbucket_token=%%*
IF [!bitbucket_token!]==[] (
	SET /P bitbucket_token=Bitbucket Token: %=%
	git config --global bitbucket.token !bitbucket_token!
)

:END
