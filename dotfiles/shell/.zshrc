# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Change location of dump files
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

ZSH_THEME="kphoen"
HIST_STAMPS="yyyy-mm-dd"

# Plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/

plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Alias
# System
alias ll="ls -alF"
# Python
alias create_venv="python -m venv --upgrade-deps .venv"
alias activate_venv="source .venv/bin/activate"
alias pip_install="pip install -r requirements.txt"
alias pip_uninstall="pip list --format=freeze | xargs pip uninstall -y"
