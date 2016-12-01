#!/usr/bin/env python
import os
from os.path import join

home = os.path.expanduser('~')
homevb = join(home, ".vim", "bundle")
xdg = join(home, ".config")
xdgnb = join(xdg, "nvim", "bundle")
repo_dir = join(home, "dotfiles")
dots = join(repo_dir, "dotsproper")
subs = join(repo_dir, "submodules")
subsv = join(subs, "vim")
subsnv = join(subs, "nvim")

#       sym link                                    source file
dotpaths = {
        join(xdg, "nvim", "ftplugin", "cpp.vim"):   join(dots, "ftplugin", "cpp.vim"),
        join(home, ".zshrc"):                       join(dots, "zshrc"),
        join(home, ".pyrc"):                        join(dots, "pyrc"),
        join(home, ".gitconfig"):                   join(dots, "gitconfig"),
        join(home, ".tmux.conf"):                   join(dots, "tmux.conf"),
        join(home, ".vimrc"):                       join(dots, "vimrc"),
        join(home, ".ssh/config"):                  join(dots, "ssh_config"),
        join(home, ".gnupg", "gpg-agent.conf"):     join(dots, "gpg-agent.conf"),
        join(home, ".gnupg", "gpg.conf"):           join(dots, "gpg.conf"),
        join(xdg, "nvim", "init.vim"):              join(dots, "init.vim"),
        join(xdg, "bpython", "config"):             join(dots, "bpython_config"),
        join(xdg, "cmus", "autosave"):              join(dots, "cmus_autosave")
        }

#       sym link                            source file
subpaths = {
        join(home, ".oh-my-zsh"):           join(subs, "zsh/oh-my-zsh"),
        join(homevb, "ctrlp.vim"):          join(subsv, "ctrlp.vim"),
        join(homevb, "vim-surround"):       join(subsv, "vim-surround"),
        join(homevb, "vim-fugitive"):       join(subsv, "vim-fugitive"),
        join(homevb, "vim-colorschemes"):   join(subsv, "vim-colorschemes"),
        join(homevb, "vim-commentary"):     join(subsv, "vim-commentary"),
        join(homevb, "dracula-theme"):      join(subs, "dracula-theme"),
        join(homevb, "vim-matlab"):         join(subsv, "vim-matlab"),
        join(homevb, "vim-matlab-daeyun"):  join(subsv, "vim-matlab-daeyun"),
        join(homevb, "vim-lightline"):      join(subsv, "vim-lightline"),
        join(xdgnb, "vim-surround"):        join(subsv, "vim-surround"),
        join(xdgnb, "ctrlp.vim"):           join(subsv, "ctrlp.vim"),
        join(xdgnb, "vim-fugitive"):        join(subsv, "vim-fugitive"),
        join(xdgnb, "vim-colorschemes"):    join(subsv, "vim-colorschemes"),
        join(xdgnb, "vim-commentary"):      join(subsv, "vim-commentary"),
        join(xdgnb, "dracula-theme"):       join(subs, "dracula-theme"),
        join(xdgnb, "vim-matlab"):          join(subsv, "vim-matlab"),
        join(xdgnb, "vim-matlab-daeyun"):   join(subsv, "vim-matlab-daeyun"),
        join(xdgnb, "deoplete-jedi"):       join(subsnv, "deoplete-jedi"),
        join(xdgnb, "deoplete.nvim"):       join(subsnv, "deoplete.nvim"),
        join(xdgnb, "neocomplete"):         join(subsnv, "neocomplete"),
        join(xdgnb, "neocomplcache"):       join(subsnv, "neocomplcache"),
        join(xdgnb, "neosnippet"):          join(subsnv, "neosnippet"),
        join(xdgnb, "neosnippet-snippets"): join(subsnv, "neosnippet-snippets"),
        join(xdgnb, "vim-airline"):         join(subsnv, "vim-airline"),
        join(xdgnb, "vim-airline-themes"):  join(subsnv, "vim-airline-themes"),
            }


def symlink(lu):
    for slink, source in lu.items():
        try:
            if os.path.exists(slink) or os.path.islink(slink):
                os.remove(slink)
            os.symlink(source, slink)
            print('original: %s\nshadow:   %s\n\n' % (source, slink))

        except:
            print('%s failed for some reason' % (slink))

def main():
    for lu in [dotpaths, subpaths]:
        symlink(lu)

if __name__ == "__main__":
    main()
