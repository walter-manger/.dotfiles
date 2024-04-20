# Dotfiles

## Install Brew

[brew.sh](https://brew.sh/)

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Stow Essentials

There are now things that get put into ~/.config, so we need to account for that.

Emacs 29 with Doom for example.

``` sh
stow -t ~/.config emacs
```

For the others, this still works.

``` sh
stow -t ~ brew zsh git ssh
```

### Get Tools

```
brew bundle install
```

#### Emacs 29, with all the "right stuff"

```sh
brew tap d12frosted/emacs-plus
brew install emacs-plus@29 --with-imagemagick --with-no-frame-refocus --with-native-comp --with-modern-doom3-icon --with-poll && osascript -e 'display notification "Add 'Other' to Spotlight Search Results"'
```

> Don't forget to add "Other" to spotlight search results!

## Getting Tree Sitter Issues?

``` sh
git clone https://github.com/casouri/tree-sitter-module
./build.sh rust
sudo cp libtree-sitter-rust.dylib /usr/local/lib
```

### Make the terminal pretty

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install Autosuggestions

``` sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## Get Doom

``` sh
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom sync
```

## Setup Git

After generating the rsa keys, do this:

In `.ssh/config`:

```
# githubPersonal
Host personal
   HostName github.com
   User git
   IdentitiesOnly yes
   IdentityFile ~/.ssh/id_rsa_personal

# githubWork
Host work
   HostName github.com
   User git
   IdentitiesOnly yes
   IdentityFile ~/.ssh/id_rsa_work

```


Create some conditionals in `.gitconfig`

```
[includeIf "gitdir:~/repos/{some organization}/"]
  path = .gitconfig-work
[includeIf "gitdir:~/repos/walter-manger/"]
  path = .gitconfig-personal
```

Then, for each gitconfig needed:

```
[user]
   name = Walter Manger
   email = {some-email}@{some-domain}.com

```

Call this way:

- `git clone git@personal:{org}/{repo}.git`
- `git clone git@work:{org}/{repo}.git`
