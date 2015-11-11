@ECHO OFF
SETLOCAL EnableDelayedExpansion

:: Get current directory as repository name
FOR %%* IN (.) DO SET repo_name=%%~n*

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
