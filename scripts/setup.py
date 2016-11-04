#!/usr/bin/env python
import os
from os.path import join

home = os.path.expanduser('~')
xdg = join(home, ".config")
repo_dir = join(home, "dotfiles")
dots = join(repo_dir, "dotsproper")
subs = join(repo_dir, "submodules")
subsv = join(subs, "vim")
subsnv = join(subs, "nvim")


dotpaths = {
        join(dots, "ftplugin", "cpp.vim"): join(xdg, "nvim", "ftplugin", "cpp.vim"),
        join(dots, "zshrc"): join(home, ".zshrc"),
        join(dots, "pyrc"): join(home, ".pyrc"),
        join(dots, "gitconfig"): join(home, ".gitconfig"),
        join(dots, "tmux.conf"): join(home, ".tmux.conf"),
        join(dots, "vimrc"): join(home, ".vimrc"),
        join(dots, "ssh_config"): join(home, ".ssh/config"),
        join(dots, "gpg-agent.conf"): join(home, ".gnupg", "gpg-agent.conf"),
        join(dots, "gpg.conf"): join(home, ".gnupg", "gpg.conf"),
        join(dots, "init.vim"): join(xdg, "nvim", "init.vim"),
        join(dots, "bpython_config"): join(xdg, "bpython", "config"),
        join(dots, "cmus_autosave"): join(xdg, "cmus", "autosave")
        }

subpaths = {
        join(subs, "oh-my-zsh"): join(home, ".oh-my-zsh"),
        join(subsv, "ctrlp.vim"): join(home, ".vim", "bundle", "ctrlp.vim"),
        join(subsv, "ctrlp.vim"): join(xdg, "nvim", "bundle", "ctrlp.vim"),
        join(subsv, "vim-surround"): join(home, ".vim", "bundle", "vim-surround"),
        join(subsv, "vim-surround"): join(xdg, "nvim", "bundle", "vim-surround"),
        join(subsv, "vim-fugitive"): join(home, ".vim", "bundle", "vim-fugitive"),
        join(subsv, "vim-fugitive"): join(xdg, "nvim", "bundle", "vim-fugitive"),
        join(subsv, "vim-colorschemes"): join(home, ".vim", "bundle", "vim-colorschemes"),
        join(subsv, "vim-colorschemes"): join(xdg, "nvim", "bundle", "vim-colorschemes"),
        join(subsv, "vim-commentary"): join(home, ".vim", "bundle", "vim-commentary"),
        join(subsv, "vim-commentary"): join(xdg, "nvim", "bundle", "vim-commentary"),
        join(subsv, "vim-matlab"): join(home, ".vim", "bundle", "vim-matlab"),
        join(subsv, "vim-matlab"): join(xdg, "nvim", "bundle", "vim-matlab"),
        join(subsv, "vim-matlab-daeyun"): join(home, ".vim", "bundle", "vim-matlab-daeyun"),
        join(subsv, "vim-matlab-daeyun"): join(xdg, "nvim", "bundle", "vim-matlab-daeyun"),
        join(subsnv, "deoplete-jedi"): join(xdg, "nvim", "bundle", "deoplete-jedi"),
        join(subsnv, "deoplete.nvim"): join(xdg, "nvim", "bundle", "deoplete.nvim"),
        join(subsnv, "neocomplete"): join(xdg, "nvim", "bundle", "neocomplete"),
        join(subsnv, "neocomplcache"): join(xdg, "nvim", "bundle", "neocomplcache"),
        join(subsnv, "neosnippet"): join(xdg, "nvim", "bundle", "neosnippet"),
        join(subsnv, "neosnippet-snippets"): join(xdg, "nvim", "bundle", "neosnippet-snippets"),
        join(subsnv, "vim-airline"): join(xdg, "nvim", "bundle", "vim-airline"),
        join(subsnv, "dwm.vim"): join(xdg, "nvim", "conditional", "dwm.vim"),
        join(subsnv, "vim-airline-themes"): join(xdg, "nvim", "bundle", "vim-airline-themes"),
        join(subsv, "vim-lightline"): join(home, ".vim", "bundle", "vim-lightline")
            }


def symlink(lu):
    for s, l in lu.items():
        try:
            if os.path.exists(l) or os.path.islink(l):
                os.remove(l)
            os.symlink(s, l)
            print('Linked original %s to shadow %s' % (s, l))

        except:
            print('%s failed for some reason' % (l))

def main():
    for lu in [dotpaths, subpaths]:
        symlink(lu)

if __name__ == "__main__":
    main()
