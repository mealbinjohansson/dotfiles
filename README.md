# Albin's dotfiles

This is my personal dotfiles, tuned to my own liking and workflow. The project
is a bare repository, tracking files outside of the git repository's directory.

The `main` branch has all my shared configuration. The `personal` branch
contains the adjustment the specific configuration for my personal computing
devices and the `work` for my work computing devices.

## Set up repo on a new computer

Begin by cloning the bare repository using ssh with the following command:

```
git clone --bare git@github.com:mealbinjohansson/dotfiles.git "$HOME/.dotfiles"
```

In order to make it easier to work with the bare repository we add an alias to
our shell. Add this line to your fish terminal or add the same alias to your
bashrc or equivalent and source it:

```
alias dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
````

Lastly checkout the repository. You might get conflicts which you will have to
solve before using the repo. The following command can now be used to checkout.

```
dotfiles checkout
```
