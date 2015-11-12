@ECHO OFF
SETLOCAL EnableDelayedExpansion

:: Get arguments; repository name and git host
SET repo_name=%1
SET git_host=%2

:: Default git host
SET def_host=Bitbucket

:: Manually set if no git host passed
IF [!git_host!]==[] (
	SET /P git_host=Enter Git Host ^(%def_host%^): %=%
)

:: Set to default git host
IF [!git_host!]==[] (
	SET git_host=%def_host%
)

:: Get current directory
FOR %%* IN (.) DO SET dir_name=%%~n*

:: Manually set if no repository name passed
IF [!repo_name!]==[] (
	SET /P repo_name=Enter Repository Name ^(%dir_name%^): %=%
)

:: Set current directory as repository
IF [!repo_name!]==[] (
	SET repo_name=%dir_name%
)

:: Get Git configuration
FOR /F "delims=" %%* IN ('git config user.name') DO SET user_name=%%*
FOR /F "delims=" %%* IN ('git config github.token') DO SET github_token=%%*
FOR /F "delims=" %%* IN ('git config bitbucket.token') DO SET bitbucket_token=%%*

ECHO|SET /P ="Creating %git_host% repository "%repo_name%" ... "
IF /I "%git_host%"=="GitHub" (
	curl -u "%user_name%:%github_token%" https://api.github.com/user/repos -d '{"name":"%repo_name%"}' 2>NUL >NUL
)
IF /I "%git_host%"=="Bitbucket" (
	curl -u "%user_name%:%bitbucket_token%" https://api.bitbucket.org/2.0/repositories/%user_name%/%repo_name% -d name="%repo_name%" -d is_private="true" 2>NUL >NUL
)
ECHO DONE^^!

ECHO|SET /P ="Pushing local code to remote ... "
IF /I "%git_host%"=="GitHub" (
	git remote add origin git@github.com:%user_name%/%repo_name%.git 2>NUL >NUL
)
IF /I "%git_host%"=="Bitbucket" (
	git remote add origin git@bitbucket.org:%user_name%/%repo_name%.git 2>NUL >NUL
)
git push -u origin master 2>NUL >NUL
ECHO DONE^^!
