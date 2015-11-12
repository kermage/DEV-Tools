@ECHO OFF
SETLOCAL EnableDelayedExpansion

:: Get argument as repository name
SET repo_name=%1

:: Get current directory
FOR %%* IN (.) DO SET dir_name=%%~n*

:: Set current directory as repository
IF [!repo_name!]==[] (
	SET repo_name=%dir_name%
)

:: Get Git configuration
FOR /F "delims=" %%* IN ('git config user.name') DO SET user_name=%%*
FOR /F "delims=" %%* IN ('git config github.token') DO SET github_token=%%*

ECHO|SET /P ="Creating Github repository "%repo_name%" ... "
curl -u "%user_name%:%github_token%" https://api.github.com/user/repos -d '{"name":"%repo_name%"}' 2>NUL >NUL
ECHO DONE^^!

ECHO|SET /P ="Pushing local code to remote ... "
git remote add origin git@github.com:%user_name%/%repo_name%.git 2>NUL >NUL
git push -u origin master 2>NUL >NUL
ECHO DONE^^!