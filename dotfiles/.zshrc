# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="spaceship"

# Just comment a section if you want to disable it
# SPACESHIP_PROMPT_ORDER=(
#   time        # Time stamps section (Disabled)
#   user          # Username section
#   dir           # Current directory section
#   host          # Hostname section
#   git           # Git section (git_branch + git_status)
#   # hg            # Mercurial section (hg_branch  + hg_status)
#   # package     # Package version (Disabled)
#   # node          # Node.js section
#   # ruby          # Ruby section
#   # elixir        # Elixir section
#   # xcode       # Xcode section (Disabled)
#   # swift         # Swift section
#   golang        # Go section
#   # php           # PHP section
#   rust          # Rust section
#   # haskell       # Haskell Stack section
#   # julia       # Julia section (Disabled)
#   docker      # Docker section (Disabled)
#   # aws           # Amazon Web Services section
#   # gcloud        # Google Cloud Platform section
#   venv          # virtualenv section
#   # conda         # conda virtualenv section
#   pyenv         # Pyenv section
#   dotnet        # .NET section
#   # ember       # Ember.js section (Disabled)
#   kubectl       # Kubectl context section
#   # terraform     # Terraform workspace section
#   exec_time     # Execution time
#   line_sep      # Line break
#   battery       # Battery level and status
#   vi_mode     # Vi-mode indicator (Disabled)
#   jobs          # Background jobs indicator
#   exit_code     # Exit code section
#   char          # Prompt character
# )
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# zsh-syntax-highlighting must be the last plugin to be loaded
plugins=(
  colorize
  deno
  docker
  docker-compose
  git
  helm
  kubectl
  minikube
  zsh-syntax-highlighting
)
# Plugins must be loaded prior to sourcing on-my-zsh.sh i.e. the line below
source $ZSH/oh-my-zsh.sh

# User configuration

# Add .NET Core SDK tools
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet
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

# Add Brew's Ruby to path (Apple silicon - might need moving for WSL)
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# PERSONAL SETUP
source ~/.aliases
source ~/.functions
source ~/.shared-shell-setup

#   -i   case-insensitive search unless search string contains uppercase letters
#   -R   color
#   -F   exit if there is less than one page of content
#   -X   keep content on screen after exit
#   -M   show more info at the bottom prompt line
#   -x4  tabs are 4 instead of 8
export LESS=-iRFXMx4

# Set vi keybindings for use in prompt
bindkey -v
# Enable command history search with `Ctrl + r`
bindkey "^R" history-incremental-search-backward

# Reduce the delay for transitioning between modes. Default is 40
export KEYTIMEOUT=1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Add function dir path
fpath+=~/.zfunc

autoload -U +X bashcompinit && bashcompinit
# AWS CLI completion
complete -C $HOMEBREW_PREFIX/bin/aws_completer aws
# Azure CLI completion
source $HOMEBREW_PREFIX/etc/bash_completion.d/az
# Hashicorp Terraform completion
complete -o nospace -C $HOMEBREW_PREFIX/bin/terraform terraform
# Hashicorp Vault completion
complete -o nospace -C $HOMEBREW_PREFIX/bin/vault vault

# Enable (and configure) zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && source ~/.config/tabtab/__tabtab.zsh || true
# zprof

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/shunt/google-cloud-sdk/path.zsh.inc' ]; then source '/home/shunt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/shunt/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/shunt/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export GPG_TTY=$(tty)
export PATH="/usr/local/sbin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=~/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
