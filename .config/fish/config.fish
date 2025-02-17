set -g fish_greeting

if status is-interactive
	starship init fish | source
end

set -Ux STARSHIP_CONFIG ~/.config/starship/starship.toml

alias lock "/sgoinfre/goinfre/Perso/jmaia/Public/pimp_my_lock/pimp_my_lock.sh ~/Videos/tortureDance.mp4 0 0 1080 1920"
alias lock2 "/sgoinfre/goinfre/Perso/jmaia/Public/pimp_my_lock/pimp_my_lock.sh ~/Videos/paprikaIntro.mp4 0 0 1080 1920"

abbr gcl git clone
abbr lla ls -lA
abbr vim nvim
