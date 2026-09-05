set -gx NVM_DIR $HOME/.nvm

if status is-interactive
    # Commands to run in interactive sessions can go here
    alias ls 'command ls -lh --color=auto'

    if type -q bash; and test -s /opt/homebrew/opt/nvm/nvm.sh
        function nvm --description 'Run NVM through its Homebrew Bash implementation'
            bash -c 'source /opt/homebrew/opt/nvm/nvm.sh && nvm "$@"' -- $argv
        end
    end

    alias dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
end
