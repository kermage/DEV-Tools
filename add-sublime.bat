@ECHO OFF

:: Skip if subl is recognized
subl --version 2>NUL >NUL && GOTO :END

:: Find Sublime path
IF EXIST "%ProgramFiles%\Sublime Text 3" (
	SET "sublime_path=%ProgramFiles%\Sublime Text 3"
) ELSE IF EXIST "%ProgramFiles(x86)%\Sublime Text 3" (
	SET "sublime_path=%ProgramFiles(x86)%\Sublime Text 3"
)

:: Skip if Sublime not found
IF [!sublime_path!]==[] GOTO :END

:: Check environment variable PATH
FOR /F "tokens=2*" %%A IN ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH') DO SET system_path=%%B
FOR /F "tokens=2*" %%A IN ('reg query "HKCU\Environment" /v PATH') DO SET user_path=%%B

:: Add Sublime to path if not exist
ECHO "%PATH%" | FINDSTR /C:"%sublime_path%" 2>NUL >NUL || (
	SET "PATH=%sublime_path%;%PATH%"
	ECHO "%system_path%" | FINDSTR /C:"%sublime_path%" 2>NUL >NUL || (
		ECHO "%user_path%" | FINDSTR /C:"%sublime_path%" 2>NUL >NUL || (
			SETX PATH "%user_path%;%sublime_path%"
		)
	)
)

:END

subl
