set -gx NVM_DIR $HOME/.nvm
set -gx EDITOR nvim
set -gx VISUAL nvim

if type -q bash; and test -s "$NVM_DIR/nvm.sh"
    set -l nvm_default_version (bash -c 'source "$NVM_DIR/nvm.sh"; nvm version default' 2>/dev/null)
    set -l nvm_default_bin "$NVM_DIR/versions/node/$nvm_default_version/bin"
    test -d "$nvm_default_bin"; and fish_add_path --prepend --path "$nvm_default_bin"

    function nvm
        bash -c 'source "$NVM_DIR/nvm.sh" && nvm "$@"' -- $argv
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    alias ls 'command ls -lh --color=auto'
    alias dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
end

set -l ruby_prefix /opt/homebrew/opt/ruby@3.3
if test -x "$ruby_prefix/bin/ruby"
    fish_add_path --prepend "$ruby_prefix/bin"
end

if type -q ruby
    set -l ruby_gem_bin (ruby -e 'print Gem.bindir' 2>/dev/null)

    if test -d "$ruby_gem_bin"
        fish_add_path --prepend "$ruby_gem_bin"
    end
end

set -l puppet_editor_services "$HOME/builds/puppet-editor-services"
if test -d "$puppet_editor_services"
    fish_add_path --prepend "$puppet_editor_services"
end
