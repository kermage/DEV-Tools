@ECHO OFF

:: Skip if no keys found
DIR /B "%USERPROFILE%\.ssh\*_rsa" 2>NUL >NUL || GOTO :END

:: Check if ssh keys are known
FOR /F "tokens=*" %%I IN ('DIR /B "%USERPROFILE%\.ssh\*_rsa"') DO CALL :CHECK_KEY %%I

GOTO :END

:CHECK_KEY
:: Add to list if ssh key is unidentified
SET is_identified=
FOR /F "tokens=*" %%J IN ('ssh-add -l ^| FINDSTR /C:"%1"') DO SET is_identified=%%J
IF "%is_identified%" == "" ssh-add "%USERPROFILE%\.ssh\%1"
GOTO:EOF

:END
