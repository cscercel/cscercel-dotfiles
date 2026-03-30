# Configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt auto_cd

export EDITOR='nvim'
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"

# Addons
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--height 50% --tmux bottom,50% --layout default --border top'
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
export BAT_THEME="OneHalfDark"

# tmux always
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach-session -t default || tmux new-session -s default
fi


# Aliases
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
alias ls='lsd -l --group-directories-first'
alias lsa='lsd -la --group-directories-first'
alias lt='lsd --tree'
alias lta='lsd -a --tree'

# Plugins
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
