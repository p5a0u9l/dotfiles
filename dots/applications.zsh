# --------------------
# APPLICATION SPECIFIC
# --------------------
if which pass > $DEVNULL; then
    # source /usr/local/Cellar/zsh-completions/0.20.0/share/zsh-completions/_pass
fi

if which cmus > $DEVNULL; then
    # bc OSX has an irritating warning related to soudn library
    alias cmus="/usr/local/bin/cmus 2>/dev/null"
fi

if which pyenv > $DEVNULL; then
    eval "$( command pyenv init - )"
fi

# fix stupid default tmux window name
if which tmux > $DEVNULL; then
    if tmux info > $DEVNULL; then
        tmux rename-window 'zsh*'
    fi
fi


