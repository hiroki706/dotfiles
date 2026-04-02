if status is-interactive
    mise activate fish --shims | source
    # Commands to run in interactive sessions can go here
    starship init fish | source
else
    mise activate fish --shims | source
end
set fish_greeting
abbr -a lg lazygit
abbr -a oc opencode
alias mr='mise r'
