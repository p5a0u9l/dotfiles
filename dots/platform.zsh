# -----------------
# PLATFORM SPECIFIC
# -----------------
if [ "$HOST" = "$MACBOOKHOSTNAME" ]; then
    # ZSH_THEME="zhann"
    source $DOTMODS/zsh/dracula-theme/dracula.zsh-theme
else
    # "powerline" "random" "zhann" "nebirhos" "awesomepanda" "agnoster"
    # "jispwoso"
    ZSH_THEME="agnoster"
fi

