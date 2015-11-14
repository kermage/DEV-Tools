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

:: Get NPM global root folder
FOR /F "tokens=*" %%I IN ('ls ^| npm root -g') DO SET npm_root=%%I

:: Check if npm package are installed
FOR %%F IN (%npm_packages%) DO CALL :CHECK_PACKAGE %%F

:: Install missing npm packages
IF NOT "%package_list%" == "" (npm install --global %package_list%) 2>NUL >NUL
GOTO:EOF

:CHECK_PACKAGE
:: Add to list if npm package is not installed
FOR /F "tokens=*" %%J IN ('ls %npm_root% ^| grep "%1"') DO SET is_installed=%%J
IF "%is_installed%" == "" SET package_list=%1 %package_list%
GOTO:EOF

:END
