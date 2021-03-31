#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Sources
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# nvm
source /usr/share/nvm/init-nvm.sh

# Aliases
alias ls='exa -lh --group-directories-first'
alias lst='exa -lh --tree --group-directories-first'

# PS1
PS1='[\u@\h \W]\$ '

# Ignore upper and lowercase when <TAB> completion
bind "set completion-ignore-case on"

# Load PATH User
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# ARCHIVE EXTRACTION
# Usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# SHOPT
shopt -s autocd           # change to named directory
shopt -s cdspell 		      # autocorrects cd misspellings
shopt -s cmdhist 		      # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend 		  # do not overwrite history
shopt -s expand_aliases 	# expand aliases
shopt -s checkwinsize 		# checks term size when bash regains control

# "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# gpg
export GPG_TTY=$(tty)

# doas
complete -cf doas
# doas alias
alias doas='doas --'

### SETTING THE STARSHIP PROMPT ###
eval "$(starship init bash)"

# my personal aliases
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'

