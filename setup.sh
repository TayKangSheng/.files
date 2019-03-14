set -e
set -x

if [ -e ~/.zshrc ]
then
  echo "this does not seems like a brand new machine."
  echo "this script is meant for setting up new machines."
  exit 1
fi

# setting brew permissions
#   https://stackoverflow.com/questions/16432071/how-to-fix-homebrew-permissions
sudo chown -R $(whoami) $(brew --prefix)/*
brew update

# set up zsh
#   install local copy of zsh
brew install zsh
#   setting zsh as default shell
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
#   setup zsh config
touch .zshrc

# set up .files
local_dir=$0
echo "source ${local_dir/setup.sh/main.sh}" >> ~/.zshrc
