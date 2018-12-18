# zsh & oh-my-zsh related
export PATH=$HOME/bin:$HOME/go/bin:/usr/local/bin:$PATH
export DEFAULT_USER="$(whoami)"
export ZSH=/usr/local/bin/zsh

setopt HIST_IGNORE_ALL_DUPS
setopt +o nomatch
prompt_context () { }
plugins=(git)

source $ZSH/oh-my-zsh.sh
ZSH_THEME=""
autoload -U promptinit; promptinit
prompt pure

# user configuration
alias python='python3'
alias pip='pip3'
alias saycn='say -v Ting-Ting'
alias sayhk='say -v Sin-ji'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
