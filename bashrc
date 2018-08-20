# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# aliases file
if [ -f ~/.bash_aliases ]; then
   source ~/.bash_aliases
fi

# added by Anaconda3 4.4.0 installer
export PATH="/home/gabriel/anaconda3/bin:$PATH"

# added by me (for yEd)
export PATH="$PATH:/home/gabriel/logitec/yEd"


export TERM="xterm-256color"

dotfiles () {
    files=(bashrc bash_aliases vimrc gvimrc);

    cd dotFiles;

    for file in "${files[@]}"
    do
        cp ~/.$file $file
        git add $file
        git commit -m "update in $file"
    done

    git push origin master;

    cd ~;
}
