# fzf
export FZF_ALT_C_COMMAND=''
export FZF_CTRL_R_OPTS="--bind 'ctrl-x:execute-silent(printf %s {1} > /tmp/.fzf-copy-$$)+abort'"
export FZF_CTRL_T_OPTS="--bind 'ctrl-x:execute-silent(printf %s {} > /tmp/.fzf-copy-$$)+abort'"

_fzf_cache="${XDG_CACHE_HOME:-$HOME/.cache}/fzf/fzf.zsh"

if [[ ! -f "$_fzf_cache" ]] || [[ "$(command -v fzf)" -nt "$_fzf_cache" ]]; then
  mkdir -p "${_fzf_cache:h}"
  if ! fzf --zsh > "$_fzf_cache" 2>/dev/null; then
    rm -f "$_fzf_cache"
    if [[ -d /usr/share/doc/fzf/examples ]]; then
      cat /usr/share/doc/fzf/examples/key-bindings.zsh \
          /usr/share/doc/fzf/examples/completion.zsh > "$_fzf_cache"
    fi
  fi
fi

if [[ -f "$_fzf_cache" ]]; then
  source "$_fzf_cache"

  _fzf_history_widget() {
    local _f="/tmp/.fzf-copy-$$"
    rm -f "$_f"
    fzf-history-widget
    if [[ -f "$_f" ]]; then
      local _n="$(<"$_f")" _cmd
      rm -f "$_f"
      _n="${_n//[^0-9]/}"
      _cmd="${history[$_n]}"
      [[ -n "$_cmd" ]] && printf '\033]52;c;%s\a' "$(printf '%s' "$_cmd" | base64 | tr -d '\n')"
    fi
  }

  _fzf_file_widget() {
    local _f="/tmp/.fzf-copy-$$"
    rm -f "$_f"
    fzf-file-widget
    if [[ -f "$_f" ]]; then
      local _path="$(<"$_f")"
      rm -f "$_f"
      [[ -n "$_path" ]] && printf '\033]52;c;%s\a' "$(printf '%s' "$_path" | base64 | tr -d '\n')"
    fi
  }

  zle -N _fzf_history_widget
  zle -N _fzf_file_widget

  bindkey -M vicmd '^F' _fzf_history_widget
  bindkey -M vicmd '^G' _fzf_file_widget
  bindkey -M vicmd '^R' redo
  bindkey -M viins '^F' _fzf_history_widget
  bindkey -M viins '^G' _fzf_file_widget
  bindkey -M viins -r '^R'
fi

unset _fzf_cache

# gpg-agent
unset SSH_AGENT_PID
if [[ ${gnupg_SSH_AUTH_SOCK_by:-0} -ne $$ ]]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY="$TTY"

# starship
_starship_cache="${XDG_CACHE_HOME:-$HOME/.cache}/starship/starship.zsh"
if [[ ! -f "$_starship_cache" ]] || [[ "$(command -v starship)" -nt "$_starship_cache" ]]; then
  mkdir -p "${_starship_cache:h}" && starship init zsh > "$_starship_cache" || rm -f "$_starship_cache"
fi
[[ -f "$_starship_cache" ]] && source "$_starship_cache"
unset _starship_cache
