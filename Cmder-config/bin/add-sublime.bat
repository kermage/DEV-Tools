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

:: Add Sublime to path if not exist
ECHO "%PATH%" | FINDSTR /C:"%sublime_path%" 2>NUL >NUL || (
	SET "PATH=%sublime_path%;%PATH%"
)

:END
