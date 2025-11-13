#--- Настройки ------------------------------------------------------
starship init fish | source
set fish_greeting

fish_add_path ~/.local/bin


#--- Алиасы ---------------------------------------------------------
alias ff "clear && fastfetch"
alias wpc "gowall convert -t catppuccin"

# Pacman
alias s "sudo pacman -S"
alias ys "yay -S"
alias syu "sudo pacman -Syu"
alias r "sudo pacman -Rcns"
alias ss "yay -Ss"
alias q "pacman -Q | grep"


#--- Функции --------------------------------------------------------
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end