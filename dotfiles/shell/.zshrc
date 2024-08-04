### Oh-My-Zsh
# https://github.com/ohmyzsh/ohmyzsh
# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export EDITOR=nvim

# Change location of dump files
export ZSH_COMPDUMP=${ZSH}/cache/.zcompdump-${HOST}

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

CASE_SENSITIVE="false"
ZSH_THEME="kphoen"
HIST_STAMPS="yyyy-mm-dd"

setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

plugins=(
    docker
    fzf-tab
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source ${ZSH}/oh-my-zsh.sh

### Oh-My-Posh
# https://ohmyposh.dev/docs/installation/prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
  eval "$(oh-my-posh init zsh --config ${HOME}/.config/oh-my-posh/oh-my-posh.toml)"
fi

### Bat
export BAT_THEME="Catppuccin Mocha"

### Brew
# https://brew.sh
export PATH=/opt/homebrew/bin:${PATH}
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

### Fzf
# https://github.com/junegunn/fzf
source <(fzf --zsh)
setopt globdots
zstyle ':completion:*' special-dirs false
zstyle ':fzf-tab:*' fzf-flags '--height=50%'

# https://github.com/Aloxaf/fzf-tab/wiki/Preview#show-file-contents
zstyle ':fzf-tab:complete:(cd|cat|bat):*' fzf-preview '
    preview_file_or_directory() {
        if [ -d "$1" ]; then
            eza --color=always --long --icons=always "$1" | head -n 20
        elif file --mime-type -b "$1" | grep -q "text"; then
            bat --style=numbers --color=always "$1"
        fi
    }
    preview_file_or_directory ${(Q)realpath}'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'

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

### Alias
# System
alias cat="bat"
alias ls="eza --color=always --all --icons=always"
alias ll="eza --color=always --all --long --icons=always"
alias clear-screen="printf '\033[H\033[2J'"
bindkey -s '^L' 'clear-screen\n'
# Python
alias create_venv="python -m venv --upgrade-deps .venv"
alias activate_venv="source .venv/bin/activate"
alias pip_install="pip install -r requirements.txt"
alias pip_uninstall="python -m venv --clear .venv"
