# installed by github.com/dt665m/dotfiles
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source ~/.zsh_plugins.sh

POWERLEVEL9K_MODE='nerdfont-complete' source  ~/powerlevel9k/powerlevel9k.zsh-theme

SAVEHIST=50
HISTFILE=~/.zsh_history