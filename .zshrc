# Configuration
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt auto_cd

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export EDITOR="nvim"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Addons
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--height 50% --tmux bottom,50% --layout default --border top'
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
export BAT_THEME="OneHalfDark"

# Aliases
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
alias ls='lsd -l --group-directories-first'
alias lsa='lsd -la --group-directories-first'
alias lt='lsd --tree'
alias lta='lsd -a --tree'

# Keybinds
bindkey -s '^f' 'tmux-sessionizer\n'

# Plugins
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
