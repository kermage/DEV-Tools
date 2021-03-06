;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --graph --decorate $*
ls=ls --show-control-chars -F --color $*
pwd=cd
clear=cls
history=cat "%CMDER_ROOT%\config\.history"
unalias=alias /d $1
vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"

open=explorer $1
mkcd=mkdir $1 & cd $1
..=cd ..
...=cd ..\..
....=cd ..\..\..
.....=cd ..\..\..\..
~=cd /d %USERPROFILE%

ga=git add $*
gb=git branch $*
gch=git checkout $*
gcl=git clone $*
gc=git commit $*
gcm=git commit -m "$*"
gcmp=git commit -m "$*" && git push
gd=git diff
gr=git remote $*
gpu=git pull $*
gp=git push $*
gpd=git push origin develop
gpm=git push origin master
gs=git status $*
gfs=git fetch && git status

npmi=npm install $*
npmig=npm install -g $*
npmis=npm install -S $*
npmid=npm install -D $*
npmu=npm uninstall $*
npmug=npm uninstall -g $*
npmcc=npm cache clean

sshconf=code "%USERPROFILE%\.ssh\config"
hosts=code "%WINDIR%\System32\drivers\etc\hosts"

suss=scoop update && scoop status
