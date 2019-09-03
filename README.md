# My macOS dotfiles
These are my dotfiles...

```
./install.sh
```

# Post Install Setup 
- Set terminal font to one of the Nerd Font types (recommending "MesloLGM Nerd Font")
- iTerm2 needs to set /usr/local/zsh on startup
- http://tgmerritt.github.io/jekyll/update/2015/06/23/option-arrow-in-iterm2.html 

# Optional Post Install Steps
- https://code.visualstudio.com/docs/setup/mac to add ```code``` command to terminals
- ```go get -u github.com/derekparker/delve/cmd/dlv```

# Git password setup
- ```cat ~/.gitconfig``` check how the password is kept.   
delete
```
[credential]
	helper = cache --timeout 604800
```
- change store apporch through ```git config --global credential.helper osxkeychain```
- regenerate token

# Divvy
- https://mizage.com/divvy/

# Todo
- make backups of .zshrc if one exists
