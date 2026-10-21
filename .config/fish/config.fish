set -gx EDITOR nvim
set -gx VISUAL $EDITOR

# Use the default Node version when NVM is installed.
set -gx NVM_DIR "$HOME/.nvm"
if command -q bash; and test -s "$NVM_DIR/nvm.sh"
    set -l nvm_default_version (bash -c 'source "$NVM_DIR/nvm.sh"; nvm version default' 2>/dev/null)
    fish_add_path --path "$NVM_DIR/versions/node/$nvm_default_version/bin"

    function nvm
        bash -c 'source "$NVM_DIR/nvm.sh" && nvm "$@"' -- $argv
    end
end

# Optional Ruby installation and gem executables.
if test -x /opt/homebrew/opt/ruby@3.3/bin/ruby
    fish_add_path --global /opt/homebrew/opt/ruby@3.3/bin
end

if command -q ruby
    set -l ruby_gem_bin (ruby -e 'print Gem.bindir' 2>/dev/null)
    fish_add_path --global "$ruby_gem_bin"
end

# Missing directories are ignored; keep these paths local to each shell.
fish_add_path --global "$HOME/.local/bin"

if status is-interactive
    set -g fish_greeting

    alias ls 'ls -lh --color=auto'
    alias eza 'eza -l'
    alias dotfiles 'git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
end
