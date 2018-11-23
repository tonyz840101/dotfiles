##### INSTALLED BY github.com/dt665m/dotfiles #####

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

# import plugins
source ~/.zsh_plugins.sh

# handle theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MODE='nerdfont-complete' 
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

# zsh configuration
SAVEHIST=50
HISTFILE=~/.zsh_history

##### INSTALLED BY github.com/dt665m/dotfiles #####