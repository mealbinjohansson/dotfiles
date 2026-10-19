# Introduction to Albin's dotfiles

This is my personal dotfiles, tuned to my own liking and workflow. The project
is a bare repository, tracking files outside of the git repository's directory.

The `main` branch has all my shared configuration. The `personal` branch
contains the adjustment the specific configuration for my personal computing
devices and the `work` for my work computing devices.

# Set up dotfiles

Begin by cloning the bare repository using ssh with the following command:

```
git clone --bare git@github.com:mealbinjohansson/dotfiles.git "$HOME/.dotfiles"
```

In order to make it easier to work with the bare repository we add an alias to
our shell. Add this line to your fish configuration file or add the same alias
to your bashrc or equivalent and source it:

```
alias dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
````

Now that we can run commands against the bare repository we should checkout the
repository to receive it's files. You might get conflicts which you will have to
solve before using the repo. The following command can now be used to checkout.

```
dotfiles checkout
```

Lastly we need to configure the bare repo to not show all untracked files in the
status. This does however mean that you will have to remember to add new files
you want to track yourself. This can be configured in git with the following
command assuming the alias for dotfiles has been set.

```
dotfiles config status.showUntrackedFiles false
```

# Configure dotfiles

## Dark mode

To enable dark mode for GTK apps, run once per machine (persists across reboots):

```sh
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
```

# Contributing

I don't really want you contributing, these are my dotfiles! However I'm
providing contribution instructions for my future self and for you if you decide
to fork my dotfiles!

## Contributing without changing branch

Since this repo contains git configuration that is set on a per-branch basis you
might want to commit shared changes to main without switching to the branch
locally. This can be done by applying a patch to a worktree containing another
branch. To create the worktree you can run the following command:

```
dotfiles worktree add .dotfiles-main main
```

An example of a command for applying the staged changes from the current branch
to the worktree is the following, which can be customized to your liking and use
case:

```
dotfiles diff --cached | git -C .dotfiles-main apply --index
```
