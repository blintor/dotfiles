#           _
#   _______| |__
#  |_  / __| '_ \
#   / /\__ \ | | |
#  /___|___/_| |_|
#
#  @Author Orosz Balint

# Load aliasses
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

autoload -U colors && colors

if ! [ -z $(cat ~/.cache/tmpfolder) ]; then  
  cd $(cat ~/.cache/tmpfolder)
fi

parse_git_branch() {
	branch=$(git symbolic-ref --short HEAD 2> /dev/null)
	branchLines=$(git symbolic-ref --short HEAD 2> /dev/null | wc -l)
	if [ "$branchLines" -gt 0 ]; then
		echo "%{$fg[white]%} - %{$fg[red]%}$branch"
	fi

}

setopt PROMPT_SUBST

# prompt
PS1="%{$fg[white]%}-|%{$fg[blue]%}%1d$(parse_git_branch)%{$fg[white]%}|->%{$reset_color%}%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# The following lines were added by compinstall
zstyle :compinstall filename '/home/oroszbalint/.config/zsh/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

# add to path
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.emacs.d/bin
export PATH=$PATH:~/Code/go/bin/
export PATH=$PATH:~/.config/composer/vendor/bin
export DENO_INSTALL="/home/balint/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# remove c-s to stop terminal
stty -ixon

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape
echo -ne '\e[1 q'

# cd print pwd every time
function cd {
    builtin cd "$@" && pwd > ~/.cache/tmpfolder
		PS1="%{$fg[white]%}-|%{$fg[blue]%}%1d$(parse_git_branch)%{$fg[white]%}|->%{$reset_color%}%b "
}

function gco {
	git checkout "$1"	&& cd .
}

setopt  autocd autopushd

# FZF
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,.cache/*,public/*}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# fnm
export PATH=/home/blntrsz/.fnm:$PATH
export PATH=/home/blntrsz/.fnm/node-versions/v14.17.5/installation/bin:$PATH
eval "`fnm env`"
export PATH=$HOME/bin:$PATH

set guifont=DroidSansMono\ Nerd\ Font\ 11

# fnm
export PATH=/home/blntrsz/.fnm:$PATH
eval "`fnm env`"
