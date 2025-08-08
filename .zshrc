# Enable Powerlevel10k instant prompt. Should stay close to the top of /home/daniel/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/zsh/ohmyzsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
export ZSH_CUSTOM="$HOME/zsh/custom"

# User binaries
if [[ -d "$HOME/.local/bin" ]]; then
  export PATH=$HOME/.local/bin:$PATH
fi

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# see https://github.com/zsh-users/zsh-completions/issues/603
FPATH+=":$ZSH_CUSTOM/plugins/zsh-completions/src"

if [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
  FPATH+=":$(/home/linuxbrew/.linuxbrew/bin/brew --prefix)/share/zsh-completions"
  FPATH+=":$(/home/linuxbrew/.linuxbrew/bin/brew --prefix)/share/zsh/site-functions"
fi

source $ZSH/oh-my-zsh.sh

# User configuration
export DEFAULT_USER="$(whoami)"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Use Windows browser in WSL
if command -v wslview &> /dev/null; then
  export BROWSER=wslview
fi

# PyEnv
if [[ -d "$HOME/.pyenv/bin" ]]; then
  export PATH=$HOME/.pyenv/bin:$PATH
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# uv
if command -v uv &> /dev/null; then
  source <(uv generate-shell-completion zsh)
fi

# Rust
if [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

# Go
if [[ -d "$HOME/go/bin" ]]; then
  export PATH=$HOME/go/bin:$PATH
fi

# Homebrew
if [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Kubernetes
if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
fi

# Helm
if command -v helm &> /dev/null; then
  source <(helm completion zsh)
fi

# Helmfile
if command -v helmfile &> /dev/null; then
  source <(helmfile completion zsh)
fi

# direnv
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# krew
if [[ -d "${KREW_ROOT:-$HOME/.krew}" ]]; then
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

# ory
if command -v ory &> /dev/null; then
  source <(ory completion zsh)
fi

# nvm via linuxbrew
if [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  source "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"

  if [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ]; then
    source "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"
  fi
fi

# pnpm
if command -v pnpm &> /dev/null; then
  source <(pnpm completion zsh)
fi

# To customize prompt, run `p10k configure` or edit $HOME/zsh/.p10k.zsh.
[[ ! -f $HOME/zsh/.p10k.zsh ]] || source $HOME/zsh/.p10k.zsh
