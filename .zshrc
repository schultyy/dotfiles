# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

plugins=(git brew ssh-agent rbenv zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

fpath+=$HOME/.zsh/pure
autoload -Uz promptinit
promptinit
prompt redhat

export PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=~/.cargo/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

export EDITOR='nvim'

bindkey "[C" forward-word
bindkey "[D" backward-word

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
alias k='kubectl'
alias be='bundle exec'

export PATH="$PATH:$HOME/.bin"
eval "$(starship init zsh)"
alias ls=exa
alias l="exa"
alias ls="exa --color=auto"
export PATH="$PATH:$HOME/.local/bin"
### BEGIN Ansible managed: .NET Core enhancement
export PATH=$PATH:$HOME/.dotnet/tools
### END Ansible managed: .NET Core enhancement
export GOPATH=$HOME/projects/go

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jan/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

helm completion zsh > "${fpath[1]}/_helm"

alias vim='nvim'

if test -f "$HOME/.env"; then
  export $(cat $HOME/.env | xargs)
fi

