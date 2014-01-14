alias ls='ls --color'
alias cw='compass watch -c src/ExtendHealth/config.rb'
alias cc='rake compass:compile'
alias ss='start src/*.sln'
alias role='whoami -groups -fo list | grep -i'
alias ff='find . -type f -name'
alias scala='scala -nobootcp'
alias bake='bundle exec rake'
alias gk='git fetch origin; gitk --all &'
alias bedit='start ~/.bashrc'
alias bsource='source ~/.bashrc'

set -o vi

fu(){
  find . -type f -name "$1" | xargs grep -nsiI "$2"
}

ful(){
  find . -type f -name "$1" | xargs grep -siIl "$2"
}

function vim(){
  if [[ $# -eq 0 ]]; then
    gvim &
  else
    gvim --remote-tab-silent "$@" &
  fi
}

function showRemote(){
  if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
    remote=$1

    if [ -z $remote ]
    then
      remote=origin
    fi
    url=$(git remote show $remote | grep "Fetch URL" | cut -c 14- | sed -r -e 's/\w+@/http:\/\//' -e '
    s/\.git$//' -e 's/\.com:/.com\//' -e 's/^\s*//')

    platform=$(uname)

    if [[ $platform == Cygwin* || $platform == MINGW* ]]; then
      opencmd=start
    elif [[ $platform == Darwin* ]]; then
      opencmd=open
    fi

    $opencmd $url
  else
    echo 'Not in a Git repository'
  fi
}

function ehclone()
{
	if [ -z "$1" ]
	then
		echo "Missing git repository url ending"
		echo "usage: myehclone 'extendhealth git repository ending' ['target directory name']"
	else
		giturl="git@github.extendhealth.com:extend-health/$1.git"

	if [ -z "$2" ]
	then
		# we DON'T HAVE a target directory
		git clone --template=C:/Users/adve/eh-git $giturl $1
	else
		# we HAVE a target directory
		git clone --template=C:/Users/adve/eh-git $giturl $2
	fi
	fi
}

[[ -s $USERPROFILE/.pik/.pikrc ]] && source $USERPROFILE/.pik/.pikrc

#source ~/.local/bin/bashmarks.sh

# Load any extra aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

