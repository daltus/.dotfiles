# Dalton Petursson's Bash Config
# .bashrc file is config for non-login, interactive shells


# Aliases
alias ~="cd ~"
alias ..="cd .."
alias cd..="cd .."
alias ls="ls -Gp"
alias lsd="ls -alh"
alias psd="ps auxwww"
alias psdl="psd | less"
alias c='clear'
alias vims='vim -S'
alias prettyjson='python_pretty_json'

# Editor of choice
export EDITOR=vim

# git aliases
alias glg="git log --oneline --all --graph --decorate"
alias gs="git status"
alias gd="git diff"
alias gb="git branch"
alias gco="git checkout"
alias gp="git pull"
alias gpsu="git pull && git submodule update"

# git completion
source ~/.dotfiles/git-completion.bash

# helper functions
function python_pretty_json() {
  cat $1 | python -m json.tool
}

#####################
# from ezprompt.net #

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[32m\]\d\[\e[m\] \[\e[32m\]\t\[\e[m\] \[\e[31m\]\u\[\e[m\]\[\e[34m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]\[\e[34m\]:\[\e[m\]\w\[\e[35m\]\`parse_git_branch\`\[\e[m\] \\$ "

# end ezprompt.net #
####################


# config for things specific to a company or machine, placed at end to allow
# overrides
if [ -f ~/.bashrc_local ]; then
  echo 'Sourcing ~/.bashrc_local'
  source ~/.bashrc_local
fi

