:: URL
SET cmder_url=https://github.com/cmderdev/cmder/releases/download/v1.3.4/cmder_mini.zip
SET sublime_url=https://download.sublimetext.com/Sublime Text Build 3143 Setup.exe
SET git_url=https://github.com/git-for-windows/git/releases/download/v2.16.1.windows.4/Git-2.16.1.4-32-bit.exe
SET node_url=https://nodejs.org/dist/v9.5.0/node-v9.5.0-x86.msi

:: Filenames
FOR %%F IN ( "%cmder_url%" ) DO SET cmder_fn=%%~nxF
FOR %%F IN ( "%sublime_url%" ) DO SET sublime_fn=%%~nxF
FOR %%F IN ( "%git_url%" ) DO SET git_fn=%%~nxF
FOR %%F IN ( "%node_url%" ) DO SET node_fn=%%~nxF
