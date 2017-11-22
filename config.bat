:: URL
SET cmder_url=https://github.com/cmderdev/cmder/releases/download/v1.3.4/cmder_mini.zip
SET sublime_url=https://download.sublimetext.com/Sublime Text Build 3143 Setup.exe
SET git_url=https://github.com/git-for-windows/git/releases/download/v2.15.0.windows.1/Git-2.15.0-32-bit.exe
SET node_url=https://nodejs.org/dist/v9.2.0/node-v9.2.0-x86.msi

:: Filenames
FOR %%F IN ( "%cmder_url%" ) DO SET cmder_fn=%%~nxF
FOR %%F IN ( "%sublime_url%" ) DO SET sublime_fn=%%~nxF
FOR %%F IN ( "%git_url%" ) DO SET git_fn=%%~nxF
FOR %%F IN ( "%node_url%" ) DO SET node_fn=%%~nxF
