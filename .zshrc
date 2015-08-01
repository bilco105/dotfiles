# Aliases
alias vi='vim'

# Editor
export EDITOR='vim'

# Include our zsh local function path
fpath=( "$HOME/.zfunctions" $fpath )

# Autoload zsh awesomeness
autoload -U compinit && compinit
autoload -U promptinit && promptinit

# Enable prompt colours                                                                                                                                  
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"
export GREP_OPTIONS='--color=auto'

# Set prompt to clean theme
prompt pure

# Show current vi mode in prompt
PROMPT='%(?.%F{magenta}.%F{red})${${KEYMAP/vicmd/❮%f}/(main|viins)/❯%f} '
function zle-line-init zle-keymap-select {
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Enable vim key-bindings
bindkey -v
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
export KEYTIMEOUT=1

# History
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# Change history searching behaviour to take command into account
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

# Source extensions
source ~/Code/dotfiles/lib/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/Code/dotfiles/lib/zsh/z/z.sh

# Enable RBEnv if it exists
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Enable VirtualEnv if it exists
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"
