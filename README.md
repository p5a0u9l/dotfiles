# README

#### Overview
This repo is intended to contain all the files I need to quickly and securely replicate my environment on a new machine. The actual dotfiles are free for comment and usage, while the pass-store is double-encrypted (see below). Please comment, contribute, or borrow at will.

## Notes and Gists
### Create new ssh key pair
#### with passphrase managed by pass and archived by fully qualified domain name (fqdn)

- `new_hostname` is the name of the target machine

        $ export fqdn=domainname/new_hostname

- Generate a passphrase for `pass` to store under "ssh" directory

        $ pass generate ssh/$fqdn 40

- Copy that string to the clipboard (authenticate with `gpg-id` passphrase)

        $ pass -c ssh/$fqdn

- Generate a new ssh key and save to an appropriate location

        $ ssh-keygen -b 4096 -C "$USER@$fqdn" -f ~/.ssh/$fqdn-id_rsa

- Copy the new key to the target machine (obviously must already have some existing authentication method)

        $ ssh-copy-id -i ~/.ssh/$fqdn-id_rsa $fqdn

- Update `sshconfig` file to contain specify which `IdentityFile` to use for each host.

    * see [sshconfig](sshconfig)

- Place a function in ~/.zshrc to shell using new pair

    * see [zshrc](zshrc)

    * Usage

        $ sssh domainname hostname

### Securely embed pass-store inside dotfiles repository

- The desire is to have access to my password store on any machine I might find myself working on. I believe this is achieved by -

    * Using `pass` to encrypt the file contents and then securing the entire store using a separate `gpg` key. This buries the store beneath two key-independant rsa encryption layers. Additionally, the file structure, containing usernames and account names, is hidden in the gpg tarball. Lastly, the synchronization procedure is (mostly) automated and convenient using git hooks.

##### pass
- [pass](https://www.passwordstore.org/) is a simple, useful password/passphrase/secret manager that essentially wraps gpg-encrypted
files into an easily navigable and manageable file architecture.

- The extra layer of security provided by encrypting the tarball comes with some procedural overhead since the store must be updated, wrapped, encrypted, and then removed (or placed in the `.gitignore`) every time a `push` to `origin` is made. Similarly, the inverse set of operations would need to be performed every time a `pull` from `origin` is made.

- The way around this is with `git` hooks. The `pre-push` hook, stored in the `.git` directory executes the following _before_
each push.

[pre-push](git-hooks/pre-push)

- While the `post-merge` hook, executes the following _after_ each `pull`.

[post-merge](git-hooks/post-merge)

- To summarize and solipsize, the content of the password-store is encrypted using the `gpg-id` I've registered with `pass` and then
the store itself is tar'd and filtered through a separate `gpg` identity. Assuming I've managed to deploy both keys to the new
machine, pulling the entire repo, and decrypting will be doable. To some, this may seem a paranoid level of effort, while to others
it may seem naively simple. However, my intent is simply to perform due diligence on securing my store while making it conveniently
available from arbitrary locations. If somehow, one of my machines is compromised by Eve, she will have access to both of the `gpg`
keys I'm using in this process, however, she'll also need both passphrases - neither of which are trivial. If she still manages to
succeed after all that, then maybe she deserves to hack my dumb online accounts. After all, there's no reason to believe I'm anything
but a mediocre target.

### Securely deploy gpg identity to a new machine

- When setting up a new machine, the `gpg` identity must be securely transferred to the new machine.

The following is borrowed from [this tutorial](https://www.phildev.net/pgp/gpg_moving_keys.html):

        $ gpg --export-secret-keys -a keyid > my_private_key.asc
        $ gpg --export -a keyid > my_public_key.asc

- Next, securely move the keys to the new machine and on that machine

        $ gpg --import my_private_key.asc
        $ gpg --import my_public_key.asc
