# Aliases
alias zshconfig="vim ~/.zshrc"
alias tmuxconfig="vim ~/.tmux.conf"
alias vimconfig="vim ~/.vimrc"
alias sshconfig="vim ~/.ssh/config"
alias ls="ls --color=auto"
alias la="ls -la"
alias woman="man"
alias cd..="cd .."

# Tmux resurrect and continuum extra session workaround
# If there exists a tmux session called "0", zsh will
# run a script to kill it and all other numbered sessions.
# To get around this if you want more than one tmux session,
# run the command `tmux new-session -t sessionname`
if [[ `tmux list-sessions | awk '{print $1}'` =~ '[0-9]+:' ]] ; then
    bash ~/.killsession0.sh
fi

# Clumsy aliases
alias cs="cd"

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

# Ensure history of commands is clean
setopt histignorealldups noincappendhistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/dawc/Documents/google-cloud-sdk/path.zsh.inc' ]; then source '/home/dawc/Documents/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/dawc/Documents/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/dawc/Documents/google-cloud-sdk/completion.zsh.inc'; fi

cd
