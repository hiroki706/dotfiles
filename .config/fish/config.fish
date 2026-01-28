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
