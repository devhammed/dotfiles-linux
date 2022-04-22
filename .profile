# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Load Snapcraft Environment
SNAPCRAFT_BUILD_ENVIRONMENT=lxd

# load Homebrew environment
HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
HOMEBREW_SHELLENV_PREFIX="/home/linuxbrew/.linuxbrew";
PATH="$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin";
MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";

# load Flutter and Dart global packages environment
PATH="$HOME/Tools/flutter/bin:$HOME/.pub-cache/bin:$PATH"

# setup Go environment
GOPATH="$HOME/Tools/go"
PATH="$GOPATH/bin:$PATH"
GOSRC="$GOPATH/src/github.com/$USER"
[[ ! -d "$GOSRC" ]] && mkdir -p "$GOSRC"

# setup Rust environment
PATH="$HOME/.cargo/bin:$PATH"

# Load Node.js extra CA Certificates
NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# Set CLI Editor
EDITOR="vim"

# Set CLI Web Browser
BROWSER="google-chrome"

# Disable PHP-CS-Fixer Env checks
PHP_CS_FIXER_IGNORE_ENV=true

# Load Android SDK Environment
ANDROID_HOME="$HOME/Android/Sdk"
ANDROID_SDK_ROOT="$ANDROID_HOME"
PATH="$ANDROID_HOME/emulator:$PATH"
PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
PATH="$ANDROID_HOME/platform-tools:$PATH"
ADB="$ANDROID_HOME/platform-tools/adb"
PATH="/snap/android-studio/current/android-studio/jre/bin:$PATH"

# Load Composer environment
PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Setup SSH-Agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)"

  ssh-add ~/.ssh/id_vertex_hp_250_g8 > /dev/null 2>&1

  ssh-add ~/.ssh/id_decagon_hp_250_g8 > /dev/null 2>&1

  ssh-add ~/.ssh/id_personal_hp_250_g8 > /dev/null 2>&1
fi

