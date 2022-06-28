# This can be copied into your ~/.profile to simplify the
# use of centaurihelp and centauripath:

# add your tools folder to PATH 
PATH+=":$HOME/.centauri/centauri-bash-lib/tools"

# here some aliases are set ...
#
# ccd               - list (library defined) path shortcuts
# ccd <path>        - change working directore to shortcut
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
alias clh='centaurihelp -L'
alias cth='centaurihelp -T'

