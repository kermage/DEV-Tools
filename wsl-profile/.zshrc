# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt
source $HOME/.zsh/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.zsh/p10k.zsh.
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh

setopt autocd correctall histignorealldups histignorespace histreduceblanks sharehistory

# Keep 2000 lines of history within the shell and save it to ~/.cache/zsh_history:
HISTSIZE=2000
SAVEHIST=$HISTSIZE
HISTFILE=~/.cache/zsh_history

# Use modern completion system
autoload -Uz compinit
zstyle ':completion:*' file-list all
eval "$(dircolors -b)"
zstyle ':completion:*:default' menu select list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist
compinit -d ~/.cache/.zcompdump
# Include hidden files
_comp_options+=(globdots)

# Load plugins last
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
