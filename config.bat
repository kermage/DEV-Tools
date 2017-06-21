:: URL
SET cmder_url=https://github.com/cmderdev/cmder/releases/download/v1.3.2/cmder_mini.zip
SET sublime_url=https://download.sublimetext.com/Sublime Text Build 3126 Setup.exe
SET git_url=https://github.com/git-FOR-windows/git/releases/download/v2.11.0.windows.3/Git-2.11.0.3-32-bit.exe
SET node_url=https://nodejs.org/dist/v6.9.4/node-v6.9.4-x86.msi

:: Filenames
FOR %%F IN ( "%cmder_url%" ) DO SET cmder_fn=%%~nxF
FOR %%F IN ( "%sublime_url%" ) DO SET sublime_fn=%%~nxF
FOR %%F IN ( "%git_url%" ) DO SET git_fn=%%~nxF
FOR %%F IN ( "%node_url%" ) DO SET node_fn=%%~nxF
