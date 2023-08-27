# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/devhammed/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

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
  npm
  pip
  yarn
  sudo
  docker
  wp-cli
  golang
  heroku
  flutter
  artisan
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

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
alias cat="bat"

# Load Snapcraft Environment
export SNAPCRAFT_BUILD_ENVIRONMENT=lxd

# load Homebrew environment
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
export HOMEBREW_SHELLENV_PREFIX="/home/linuxbrew/.linuxbrew";
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin";
export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";

# load fly.io command tool
export FLYCTL_INSTALL="/home/devhammed/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# load Flutter and Dart global packages environment
export PATH="$HOME/Tools/flutter/bin:$HOME/.pub-cache/bin:$PATH"

# setup Go environment
export GOPATH="$HOME/Tools/go"
export PATH="$GOPATH/bin:$PATH"
export GOSRC="$GOPATH/src/github.com/$USER"
[[ ! -d "$GOSRC" ]] && mkdir -p "$GOSRC"

# setup Rust environment
export PATH="$HOME/.cargo/bin:$PATH"

# Load Node.js extra CA Certificates
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# Set CLI Editor
export EDITOR="vim"

# Set CLI Web Browser
export BROWSER="google-chrome"

# Setup JetBrains ToolBox
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"

# Load Android SDK Environment
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export ADB="$ANDROID_HOME/platform-tools/adb"
export PATH="/snap/android-studio/current/android-studio/jre/bin:$PATH"

# Load Composer environment
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Setup SSH-Agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)"

  ssh-add ~/.ssh/id_vertex > /dev/null 2>&1

  ssh-add ~/.ssh/id_decagon > /dev/null 2>&1

  ssh-add ~/.ssh/id_personal > /dev/null 2>&1

  ssh-add ~/.ssh/id_nomad_internet > /dev/null 2>&1
fi

# load Homebrew ZSH autocompletions
if type brew &>/dev/null; then
  fpath+="$(brew --prefix)/share/zsh/site-functions"
fi

# include custom completions
if [[ -d "$HOME/.zfunc" ]]; then
  fpath+="$HOME/.zfunc"
fi

# initialize completions engine
autoload -Uz compinit

if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
  touch ~/.zcompdump
else
  compinit -C
fi

# Disable PHP-CS-Fixer env checks
export PHP_CS_FIXER_IGNORE_ENV=true

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/devhammed/Tools/google-cloud-sdk/path.zsh.inc' ]; then . '/home/devhammed/Tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/devhammed/Tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/devhammed/Tools/google-cloud-sdk/completion.zsh.inc'; fi

# Load Zoxide
eval "$(zoxide init zsh)"

# Setup GH Configuration Directory
export GH_CONFIG_DIR="$HOME/.config/gh/personal"

# Load DirEnv
export DIRENV_LOG_FORMAT=
eval "$(direnv hook zsh)"

# Load Starship Prompt
eval "$(starship init zsh)"

## [Completion] 
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/devhammed/.dart-cli-completion/zsh-config.zsh ]] && . /home/devhammed/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# Wasmer
export WASMER_DIR="/home/devhammed/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
