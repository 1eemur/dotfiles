export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="lukerandall"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
    export EDITOR='nvim'
fi

#export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:~/bin
export PF_INFO="ascii title os kernel host uptime memory de shell palette"

# Aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias ll="ls -la"
alias dfu="sudo dnf -y update && sudo dnf upgrade"
alias pf="pfetch"
alias neof="neofetch --ascii ~/.config/neofetch/lain-solid-col.txt"
alias myip="curl ipinfo.io/ip"
alias brc="nvim ~/.bashrc"
alias zrc="nvim ~/.zshrc"
alias fu="flatpak update"
alias i3conf="nvim ~/.config/i3/config"
alias swayconf="nvim ~/.config/sway/config"
alias vim="nvim"
alias nv="nvim"
alias dv="devour"
alias dvz="devour zathura"
alias dvm="devour mpv"
alias p8="ping 8.8.8.8"
alias myip="curl ipinfo.io/ip"
alias i3lock="i3lock -c 000000"
alias swaylock="swaylock -f -c 000000"
alias vencord='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias sleepon='xset s on && xset +dpms'
alias sleepoff='xset s off && xset -dpms'
alias sleepoff='xset s off && xset -dpms'
alias wtl='/home/lmr/.local/bin/sol -lat=59.4370 -lon=24.7536'
alias rtk="rmtk ~/Videos/Books"

function extract {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

(cat ~/.cache/wal/sequences &)
dfi(){
	sudo dnf install "$1"
}
dfr(){
	sudo dnf remove "$1"
}
mkcd (){
	mkdir -p -- "$1" && cd -P -- "$1"
}
wotd (){
    python3 /home/lmr/Documents/Projects/Coding/Genekas/genekas.py "$1"
}

