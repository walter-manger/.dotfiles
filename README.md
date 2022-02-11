# Dotfiles

## Install Brew

[brew.sh](https://brew.sh/)

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Stow Essentials

``` sh
stow -t ~ brew zsh emacs git ssh
```

### Get Tools

```
brew bundle install
```

### Make it pretty

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install Autosuggestions

``` sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## Get Doom

``` sh
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
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
