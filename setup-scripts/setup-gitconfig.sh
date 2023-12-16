FILE=$HOME/.gitconfig

if test -f "$FILE"; then
    echo "$FILE exists. Please rename the file or delete the file and run this script again."
else
    ln -s $HOME/.files/.gitconfig $HOME/.gitconfig
fi

