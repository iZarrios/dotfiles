# Get the current user

# NOTE: I will be appending a suffix of _v42069 to every custom variable
current_user_v42069=$(whoami)

# Use a case statement to act based on the current user
case "$current_user_v42069" in
  zarrios)
    # Perform actions specific
    export EXTERNAL_DRIVE_v42069="/mnt/yes" 
    ;;
  phormico)
    export EXTERNAL_DRIVE_v42069="/mnt/vsh" 
    # Perform actions specific
    ;;
  *)
    echo "Hello, $current_user_v42069! You are not currently listed in the .zshrc"
    ;;
esac

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PYRIGHT_PYTHON_FORCE_VERSION=latest
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set list of themes to pick from when loading at random
ZSH_THEME="eastwood"
# ZSH_THEME="robbyrussell"
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
	sudo
	fast-syntax-highlighting # cfg: fast-theme zdharma
    # zsh-vi-mode
	
)


# # Only changing the escape key to `jk` in insert mode, we still
# # keep using the default keybindings `^[` in other modes
# ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
# ZVM_VI_ESCAPE_BINDKEY=kj

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# zvm_after_init_commands+=('')
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPS="--extended"


# Bindings
# zvm_after_init_commands+=('')
bindkey -s ^f "tmux-sessionizer\n"


# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias ping-="ping 4.2.2.1"
alias rp="realpath"
alias cclip="xclip -selection clipboard"
alias pclip="xclip -selection clipboard"
alias fd="fdfind"
alias gst="git status"
alias lg="lazygit"
alias tmux="tmux -2"
alias v="nvim"
alias cat="batcat --color=always"
alias tree="tree -I 'node_modules|target'"
alias path='echo -e ${PATH//:/\\n}' # print path on multiple lines
alias mv='mv -i'
alias dl='cd ~/Downloads'
alias grep="rg"
alias mktmux='tmux new -s "$(realpath .| tr " " _ | xargs basename | tr . _)"'
alias v.="v ."

# alias ohmyzsh="mate ~/.oh-my-zsh"
# source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Adding go binaries
export PATH=$PATH:"$HOME/bin/go"
export PATH=$PATH:"$HOME/.cargo/bin"

# Adding local scripts
export PATH=$PATH:"$HOME/.local/scripts/"
# Adding `go` and `gofmt`
export PATH=$PATH:"$HOME/custom_build/go/bin"
# Adding node
export PATH=$PATH:"$HOME/.n/bin/node"

export PATH=$PATH:"/usr/local/bin/"
export PATH=$PATH:"$HOME/bin"

# Adding GCC-GNU-ARM toolchain
export PATH=$PATH:"$HOME/bin/arm-gnu-toolchain-13.2.Rel1-x86_64-arm-none-eabi/bin/"
export PATH=$PATH:"$HOME/work/ittia/apache-maven-3.9.6/bin"

# Adding cross-gcc-compiler
export PATH=$PATH:"$HOME/opt/cross/bin"

# making batcat the default pager
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

# Go cache module location overwrite
export GOMODCACHE=~/caches/
export GOBIN=~/bin/go
