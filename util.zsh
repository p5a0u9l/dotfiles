function gitignore() {
    printf "$1\n" >> .gitignore
}

function prompt_confirm() {
    echo "$1 [CR]" 
    vared jnk
}

function remove_gitmodule() {
    prompt_confirm "start at top of repo"
    cd $DOTHOME

    prompt_confirm "start with a clean repo"
    git add -A
    git commit

    prompt_confirm "remove $1 reference from .gitmodules"
    $EDITOR .gitmodules

    prompt_confirm "remove $1 reference from .git/config"
    $EDITOR .git/config

    prompt_confirm "remove $1 from cached"
    git rm --cached $1

    prompt_confirm "remove $1 from database"
    rm -rf .git/modules/$1

    prompt_confirm "commit the change"
    git add -A
    git commit

    prompt_confirm "finally, remove $1 from file system"
    rm -rf $1
}
