alias e.'=explorer .'
alias gl='git log --oneline --graph --decorate'
alias ls='ls --show-control-chars -F --color'
alias vi='vim'

alias open='explorer'
function mkcd() { mkdir $1 && cd $1; }
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ga='git add'
alias gb='git branch'
alias gch='git checkout'
alias gcl='git clone'
alias gc='git commit'
function gcm() { git commit -m "$*"; }
function gcmp() { git commit -m "$*" && git push; }
alias gd='git diff'
alias gr='git remote'
alias gpu='git pull'
alias gp='git push'
alias gpd='git push origin develop'
alias gpm='git push origin master'
alias gs='git status'
alias gfs='git fetch && git status'

alias npmi='npm install'
alias npmig='npm install -g'
alias npmis='npm install -S'
alias npmid='npm install -D'
alias npmu='npm uninstall'
alias npmug='npm uninstall -g'
alias npmcc='npm cache clean'

alias sshconf='code ~/.ssh/config'
alias hosts='code $WINDIR/System32/drivers/etc/hosts'

alias suss='scoop update && scoop status'
