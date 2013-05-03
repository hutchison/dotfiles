function e; vim $argv; end

function ef; vim ~/.config/fish/config.fish; end
function ev; vim ~/.vimrc; end
function em; vim ~/.mutt/muttrc; end
function eg; vim ~/.gitconfig; end

set MUTT_BIN (which mutt)
function mutt; bash --login -c "cd ~/Desktop; $MUTT_BIN"; end

function g; git $argv; end

function vu; vagrant up; end
function vs; vagrant suspend; end

function o; open $argv; end
function oo; open .; end

function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end

prepend_to_path "$HOME/dotfiles/bin"

set -g -x fish_greeting ''
set -g -x EDITOR vim

function git_prompt
    if git rev-parse --show-toplevel >/dev/null 2>&1
        set_color normal
        printf ' auf '

        set_color magenta
        printf '%s' (git rev-parse --abbrev-ref HEAD)

        set git_changed (git diff --name-status | wc -l)
        if test $git_changed -gt 0
            set_color red
            printf ' %sM' $git_changed
        end

        set git_staged (git diff --name-status --staged | wc -l)
        if test $git_staged -gt 0
            set_color green
            printf ' %sM' $git_staged
        end

        set git_untracked (git ls-files --others --exclude-standard | wc -l)
        if test $git_untracked -gt 0
            set_color cyan
            printf ' %s?' $git_untracked
        end

        set_color normal
    end
end

function fish_prompt
    set last_status $status

    set_color green
    printf '%s' $USER

    set_color normal
    printf ' auf '

    set_color red
    printf '%s' (hostname)

    set_color normal
    printf ' in '

    set_color blue
    printf '%s' (prompt_pwd)

    git_prompt

    echo

    if test $last_status -eq 0
        set_color white -o
        printf '><((°> '
    else
        set_color red -o
        printf '[%d] ><((ˣ> ' $last_status
    end

    set_color normal
end
