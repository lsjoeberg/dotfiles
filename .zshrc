# ====== Main Settigns ========================================================

# Set TERM
export TERM='xterm-256color'

# Path to oh-my-zsh installation
export ZSH="${HOME}/.oh-my-zsh"

# Starship init script
eval "$(starship init zsh)"

# ====== Library Settings =====================================================

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

# ====== Plugins ==============================================================
# Standard plugins ~/.oh-my-zsh/plugins/*
# Custom plugins ~/.oh-my-zsh/custom/plugins/

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-completions
    colored-man-pages
    git-auto-fetch
    git-flow-completion
    docker
    docker-compose
)

source $ZSH/oh-my-zsh.sh

# ====== User configuration ===================================================
# Set e.g. MANPATH, LANG, EDITOR, Compilaion flags.

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# ====== Command Completion ===================================================

if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion zsh)
    complete -F __start_kubectl k
fi

# === Shell Hooks =============================================================

# hook `direnv` into the shell
if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

# use nord theme dircolors
if [ -r ~/.dir_colors ]; then
    case $(uname) in
    'Linux')
        eval $(dircolors ~/.dir_colors)
        ;;
    'Darwin')
        eval $(gdircolors ~/.dir_colors)
        ;;
    esac
fi

# initialize pyenv (after .zprofile env config)
if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# fzf autocompletion and key-bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
