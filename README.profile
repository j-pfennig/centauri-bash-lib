# This can be copied into your ~/.profile to simplify the
# use of centaurihelp and centauripath:

# add your tools folder to PATH 
PATH+=":$HOME/.centauri/centauri-bash-lib/tools"

# here some aliases are set ...
#
# ccd               - list (library defined) path shortcuts
# ccd <path>        - change working directory to shortcut
#
# clh               - library reference
# clh [+-=] <key>   - show documentation for <key>

# ccd needs a little helper
_ccd_helper () {
    if [ $# = 0 -o "${1::1}" = '-' ] ; then
        centauripaths --embed ccd -I "$@"
    else
        local cdes=$(centauripaths --embed ccd --error "$@");
        [ -n "$cdes" ] && cd "$cdes"
    fi
}
alias ccd='_ccd_helper'

_cfi_helper () { 
    find -xdev \( -name ".encfs_*" -o -name ".cache" \) -prune -o -iname "*$**" -print
}
alias cfi='_cfi_helper'

alias clh='centaurihelp -L'
alias cth='centaurihelp -T'

alias ..='cd ..'
alias grep='grep --color=auto'
alias less='less --tabs=4'
alias ll='ls -lh'
alias ls='ls --color=auto --time-style="+%F %H:%M"'
alias mail='mail -a "Content-Type: text/plain; charset=UTF-8"'
alias phys='cd -P "$PWD"'
alias server='centaurissh exec ---'
