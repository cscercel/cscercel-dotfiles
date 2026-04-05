# my-neovim-config
I use Vim, btw.


### Instructions for tmux-sessionizer

1. Create executable script 

```
mkdir -p ~/.local/bin
touch ~/.local/bin/tmux-sessionizer
chmod +x ~/.local/bin/tmux-sessionizer

```
2. Paste this

```
#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/personal ~/work ~/projects -mindepth 1 -maxdepth 1 -type d 2>/dev/null | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name

```
3. ZSH

```
# ~/.zshrc
export PATH="$HOME/.local/bin:$PATH"
bindkey -s '^f' 'tmux-sessionizer\n'
```

4. TMUX

```
# ~/.tmux.conf
bind-key -r f run-shell "tmux neww ~/.local/bin/tmux-sessionizer"
```

5. NVIM

```
# ~/.config/nvim/lua/config/keybinds.lua
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
```
