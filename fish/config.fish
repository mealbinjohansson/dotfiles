set -g fish_greeting ""
if status is-interactive
    fastfetch
end

set -gx EDITOR nvim

alias ll="ls -lh"
