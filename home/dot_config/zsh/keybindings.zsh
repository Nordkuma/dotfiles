# vi mode
_vi-cmd-mode-ime-off() {
  (( $+commands[ime] )) && ime off &>/dev/null &!
  zle vi-cmd-mode
}

_paste-in-insert-mode() {
  local _keymap=$KEYMAP
  zle -K viins
  zle .bracketed-paste
  zle -K $_keymap
}

autoload -Uz edit-command-line
zle -N _vi-cmd-mode-ime-off
zle -N bracketed-paste _paste-in-insert-mode
zle -N edit-command-line

bindkey -v
bindkey -M vicmd '^[[A' beginning-of-buffer-or-history
bindkey -M vicmd '^[[B' end-of-buffer-or-history
bindkey -M vicmd '^[[C' vi-end-of-line
bindkey -M vicmd '^[[D' vi-beginning-of-line
bindkey -M vicmd '^[OA' beginning-of-buffer-or-history
bindkey -M vicmd '^[OB' end-of-buffer-or-history
bindkey -M vicmd '^[OC' vi-end-of-line
bindkey -M vicmd '^[OD' vi-beginning-of-line
bindkey -M vicmd '^@' _vi-cmd-mode-ime-off
bindkey -M vicmd '^[' _vi-cmd-mode-ime-off
bindkey -M vicmd '^e' edit-command-line
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^@' _vi-cmd-mode-ime-off
bindkey -M viins '^[' _vi-cmd-mode-ime-off
bindkey -M viins '^e' edit-command-line
bindkey -M viins '^H' backward-delete-char
