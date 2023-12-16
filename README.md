# My Dotfiles manager

Setup: (Only need to be done once)
```
# Change to root directory
$ cd

# Clone the repository
$ git@github.com:TayKangSheng/.files.git 

# Add initialization script into .zshrc
$ echo "source ~/.files/main.sh" >> ~/.zshrc

# Call setup scripts (see setup-scripts folder for list of scripts)
$ ~/.files/setup-scripts/setup-gitconfig.sh
$ ~/.files/setup-scripts/setup-ruby.sh

# Reload .bashrc
$ source ~/.zshrc
```
