set -e
set -x

if [ -e ~/.zshrc ]
then
  echo "this does not seems like a brand new machine."
  echo "this script is meant for setting up new machines."
  exit 1
fi

# setting brew permissions [https://stackoverflow.com/questions/16432071/how-to-fix-homebrew-permissions]
sudo chown -R $(whoami) $(brew --prefix)/*
brew update

# set up zsh
#   install local copy of zsh
brew install zsh
#   setting zsh as default shell
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#   install useful oh-my-zsh plugins. [https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins]
sed -i '' 's/plugins=(git)/plugins=(git last-working-dir z)/' ~/.zshrc

# set up .files
local_dir=$0
touch .zshrc
echo "" >> ~/.zshrc 
echo "# setup for https://github.com/TayKangSheng/.files" >> ~/.zshrc
echo "source ${local_dir/setup.sh/main.sh}" >> ~/.zshrc
source ${local_dir/setup.sh/main.sh}

# install powerline fonts
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts
