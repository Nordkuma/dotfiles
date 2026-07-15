# hooks
_add-newline() {
  if [[ -z $_newline_before_prompt ]]; then
    _newline_before_prompt=1
  elif [[ $_newline_before_prompt -eq 1 ]]; then
    echo
  fi
}

_update-gpg-tty() {
  case ${1%% *} in
    chezmoi|git|scp|sftp|ssh|ssh-*)
      gpg-connect-agent updatestartuptty /bye >/dev/null ;;
  esac
}

typeset -U precmd_functions preexec_functions

precmd_functions+=(_add-newline)
#preexec_functions+=(_update-gpg-tty)
