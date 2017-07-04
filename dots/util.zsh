function gitignore() {
    printf "$1\n" >> $PWD/.gitignore
}

function prompt_confirm() {
    echo "$1 [CR]"
    jnk=""
    vared jnk
}

function remove_gitmodule() {
    prompt_confirm "start at top of repo"
    cd $DOTHOME

    prompt_confirm "remove $1 reference from .gitmodules"
    $EDITOR .gitmodules

    prompt_confirm "commit the change"
    git add -A
    git commit -m "remove $1"

    prompt_confirm "remove $1 reference from .git/config"
    $EDITOR .git/config

    prompt_confirm "remove $1 from cached"
    git rm --cached $1

    prompt_confirm "remove $1 from database"
    rm -rf .git/modules/$1

    prompt_confirm "commit the change"
    git add -A
    git commit -m "remove $1"

    prompt_confirm "finally, remove $1 from file system"
    rm -rf $1
}

# test if a given program exists
function has() {
    if [[ `which $1` > $DEVNULL ]]; then
        echo "yep"
    else
        echo "nope"
    fi
}

prefix='\e['
postfix='m'
default=$prefix'39'$postfix
magenta=$prefix'35'$postfix
cyan=$prefix'36'$postfix
blue=$prefix'34'$postfix
red=$prefix'31'$postfix
green=$prefix'32'$postfix
yellow=$prefix'33'$postfix