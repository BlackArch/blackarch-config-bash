# colors
white="$(tput bold ; tput setaf 7)"
blue="$(tput bold; tput setaf 4)"
cyan="$(tput bold; tput setaf 6)"
if [ "$(tput colors 2>/dev/null || echo 0)" -ge 16 ]; then
  darkgrey="$(tput setaf 8)"
else
  darkgrey="$(tput bold ; tput setaf 0)"
fi
nc="$(tput sgr0)"

# exports
export PATH="${HOME}/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin"
export PATH="${PATH}:/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin"

if [[ $EUID -eq 0 ]]; then
  PS1="\[$blue\][ \[$cyan\]\H \[$darkgrey\]\w\[$darkgrey\] \[$blue\]]\\[$darkgrey\]# \[$nc\]"
else
  PS1="\[$blue\][ \[$cyan\]\H \[$darkgrey\]\w\[$darkgrey\] \[$blue\]]\\[$cyan\]\$ \[$nc\]"
fi

case $- in *i*)
  if [ "${TERM:-dumb}" != dumb ]; then
    _ba_prompt_sp() { printf '\e[7m%%\e[m%*s\r' "$(( ${COLUMNS:-80} - 1 ))" ''; }
    case " ${PROMPT_COMMAND[*]} " in
      *" _ba_prompt_sp "*) ;;
      *) PROMPT_COMMAND+=(_ba_prompt_sp) ;;
    esac
  fi
;; esac

export LD_PRELOAD=""
export EDITOR="vim"

# alias
alias ls="ls --color"
alias vi="vim"
alias shred="shred -zf"
#alias python="python2"
alias wget="wget -U 'noleak'"
alias curl="curl --user-agent 'noleak'"
