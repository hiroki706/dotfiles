if status is-interactive
    mise activate fish | source
    # Commands to run in interactive sessions can go here
    starship init fish | source
else
    mise activate fish --shims | source
end
set fish_greeting
export FIREFOX_BIN="/mnt/c/Program Files/Mozilla Firefox/firefox.exe"
abbr -a lg lazygit
alias mr='mise r'
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
