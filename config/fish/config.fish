# mise starship
if status is-interactive
    mise activate fish --shims | source
    starship init fish | source
else
    mise activate fish --shims | source
end

set fish_greeting
# エイリアス
abbr -a lg lazygit
abbr -a ldock lazydocker
abbr -a oc opencode
alias mr='mise r'

# opam設定
test -r '/home/hirok/.opam/opam-init/init.fish' && source '/home/hirok/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true

# yazi設定
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end
