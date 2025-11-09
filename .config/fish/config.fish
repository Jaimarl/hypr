#--- Настройки ------------------------------------------------------
starship init fish | source
set fish_greeting

fish_add_path ~/.local/bin


#--- Алиасы ---------------------------------------------------------
alias ff "clear && fastfetch"
alias s "yay -Ss"


#--- Функции --------------------------------------------------------
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end