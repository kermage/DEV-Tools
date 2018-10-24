:: URL
SET cmder_url=https://github.com/cmderdev/cmder/releases/download/v1.3.4/cmder_mini.zip
SET sublime_url=https://download.sublimetext.com/Sublime Text Build 3143 Setup.exe

:: Filenames
FOR %%F IN ( "%cmder_url%" ) DO SET cmder_fn=%%~nxF
FOR %%F IN ( "%sublime_url%" ) DO SET sublime_fn=%%~nxF
