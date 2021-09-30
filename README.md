# Dotfiles


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

Call this way:

- `git clone git@personal:{org}/{repo}.git`
- `git clone git@work:{org}/{repo}.git`

