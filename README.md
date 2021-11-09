# Dotfiles

## Install Brew

[brew.sh](https://brew.sh/)

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Get Tools

```
brew bundle install
```

### Make it pretty

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Setup Git

After generating the rsa keys, do this:

In `.ssh/config`:

```
# githubPersonal
Host personal
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_rsa_personal

# githubWork
Host work
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_rsa_work

```

TODO: Add some information about conditional gitconfig

Call this way:

- `git clone git@personal:{org}/{repo}.git`
- `git clone git@work:{org}/{repo}.git`

