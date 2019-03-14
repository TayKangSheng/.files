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
sed -i '' 's/plugins=(git)/plugins=(last-working-dir z)/' ~/.zshrc

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

# setup git configurations
#   alias
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.lg "log --all --graph --full-history --color --date=short --pretty=format:''%x1b[31m%h%x09%x1b[30;1m%ad%x1b[0m%x1b[32m%d%x1b[0m%x20%s%x20%x1b[34;1m[%aE]''"
git config --global alias.br branch
git config --global alias.cm commit -m
git config --global alias.pl pull
git config --global alias.ph push
git config --global alias.rs1 "reset HEAD~1 --soft"
#   pager
git config --global pager.branch false
#   help
git config --global help.autocorrect 1
