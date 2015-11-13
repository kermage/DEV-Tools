@ECHO OFF
TITLE NPM Installation
SETLOCAL EnableDelayedExpansion

:: Find NodeJS path
IF EXIST "%ProgramFiles%\nodejs" (
	SET "nodejs_path=%ProgramFiles%\nodejs"
) ELSE IF EXIST "%ProgramFiles(x86)%\nodejs" (
	SET "nodejs_path=%ProgramFiles(x86)%\nodejs"
)

:: Skip if NodeJS not found
IF [!nodejs_path!]==[] GOTO :END

:: Add NodeJS to path
SET "PATH=%nodejs_path%;%PATH%"

:: NPM packages to install
SET /P npm_packages=Enter Packages: %=%

:: Install npm packages
(npm install --global %npm_packages%) 2>NUL >NUL

:END
