@ECHO OFF
SETLOCAL EnableDelayedExpansion

:: Get arguments; git host, git user and repository name
SET git_host=%1
SET git_user=%2
SET repo_name=%3

:: Default git host
SET def_host=Bitbucket

:: Manually set if no git host passed
IF [!git_host!]==[] (
	SET /P git_host=Enter Git Host ^(%def_host%^): %=%
)

:: Set to default git host
IF /I NOT "%git_host%"=="GitHub" (
	IF /I NOT "%git_host%"=="Bitbucket" (
		SET git_host=%def_host%
	)
)

:: Get default git user
FOR /F "delims=" %%* IN ('git config user.name') DO SET user_name=%%*

:: Manually set if no git user passed
IF [!git_user!]==[] (
	SET /P git_user=Enter %git_host% User ^(%user_name%^): %=%
)

:: Set to default git user
IF [!git_user!]==[] (
	SET git_user=%user_name%
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

:: Replace spaces in repository name with hypens
SET repo_name=%repo_name: =-%

:: Get Git configuration
FOR /F "delims=" %%* IN ('git config user.name') DO SET user_name=%%*
FOR /F "delims=" %%* IN ('git config github.token') DO SET github_token=%%*
FOR /F "delims=" %%* IN ('git config bitbucket.token') DO SET bitbucket_token=%%*

IF /I "%git_host%"=="GitHub" (
	curl -u "%git_user%" https://api.github.com/user/repos -d '{"name":"%repo_name%"}'
)
IF /I "%git_host%"=="Bitbucket" (
	SET repo_slug=%repo_name%
	FOR %%A IN ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j"
	"K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v"
	"W=w" "X=x" "Y=y" "Z=z") DO CALL SET repo_slug=%%repo_slug:%%~A%%
	curl -u "%git_user%" https://api.bitbucket.org/2.0/repositories/%git_user%/!repo_slug! -d name="%repo_name%" -d is_private="true"
)

ECHO|SET /P ="Pushing local code to remote ... "
IF /I "%git_host%"=="GitHub" (
	git remote add origin git@github.com:%git_user%/%repo_name%.git 2>NUL >NUL
)
IF /I "%git_host%"=="Bitbucket" (
	git remote add origin git@bitbucket.org:%git_user%/%repo_slug%.git 2>NUL >NUL
)
git push -u origin master 2>NUL >NUL
ECHO DONE^^!
