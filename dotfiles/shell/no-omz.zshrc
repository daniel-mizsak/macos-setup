### General
export EDITOR=nvim
export SUDO_EDITOR=nvim

### Zsh Autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
source ${HOME}/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

### Zsh Syntax Highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source ${HOME}/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### Brew
# https://brew.sh
# export PATH=/opt/homebrew/bin:${PATH}
# if type brew &>/dev/null
# then
#   FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

#   autoload -Uz compinit
#   compinit
# fi

### Oh-My-Posh
# https://ohmyposh.dev/docs/installation/prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ${HOME}/.config/oh-my-posh/oh-my-posh.toml)"
fi

### Bat
# https://github.com/sharkdp/bat
# https://nix-community.github.io/home-manager/options.xhtml#opt-programs.bat.themes
export BAT_THEME="Catppuccin Mocha"

### Zoxide
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init --cmd cd zsh)"

### Fzf
# https://github.com/junegunn/fzf
source <(fzf --zsh)
setopt globdots
zstyle ':completion:*' special-dirs false

### Fzf-Tab
# https://github.com/Aloxaf/fzf-tab?tab=readme-ov-file#install
source ${HOME}/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

### Atuin
# https://github.com/atuinsh/atuin
eval "$(atuin init zsh)"

### Pyenv
# https://github.com/pyenv/pyenv?tab=readme-ov-file#set-up-your-shell-environment-for-pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

### Fastfetch
# https://github.com/fastfetch-cli/fastfetch
if [ -z "$TMUX" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
  fastfetch
fi

### Yazy
# https://yazi-rs.github.io/docs/quick-start
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

### Alias
# System
alias cat="bat"
alias ls="eza --color=always --all --icons=always"
alias ll="eza --color=always --all --long --icons=always"
alias lzd="lazydocker"
# Kubernetes
alias k="kubectl"
# Python
alias create_venv="python -m venv --upgrade-deps .venv"
alias activate_venv="source .venv/bin/activate"
alias pip_install="pip install -r requirements.txt"
alias pip_uninstall="python -m venv --clear .venv"
