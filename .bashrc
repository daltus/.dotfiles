# Dalton Petursson's Bash Config
# .bashrc file is config for non-login, interactive shells


# Editor of choice
export EDITOR=vim

# use 'type' builtin to see what an alias is
# e.g.
# $ type ls
# ls is aliased to `ls -Gp'

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

# git aliases
alias gl="git log"
alias glg="gl --oneline --branches --graph --decorate"
alias glga="glg --all"
alias gs="git status"
alias gd="git diff"
alias gb="git branch"
alias gbs="gb --sort=committerdate" # ASC, negative committerdate for DESC
alias gco="git checkout"
alias gp="git pull"
alias gsu="git submodule update"
alias gpsu="gp && gsu"

# git completion
source ~/.dotfiles/git-completion.bash
# git completion for aliases
__git_complete gl _git_log
__git_complete gs _git_status
__git_complete gd _git_diff
__git_complete gb _git_branch
__git_complete gco _git_checkout
__git_complete gp _git_pull

# fancy git prompt __git_ps1, also has documentation for following GIT_PS1_* variables
source ~/.dotfiles/git-prompt.sh
# unstaged (*) and staged (+)
export GIT_PS1_SHOWDIRTYSTATE=1
# $ next to branch name
export GIT_PS1_SHOWSTASHSTATE=1
# % next to branch name
export GIT_PS1_SHOWUNTRACKEDFILES=1
# see doc
# export GIT_PS1_SHOWUPSTREAM="auto"
# detached HEAD will have extra info about being relative to branch
export GIT_PS1_DESCRIBE_STYLE="branch"
# color hints, only available when using __git_ps1 for PROMPT_COMMAND, i.e. not PS1
GIT_PS1_SHOWCOLORHINTS=1
# hide git prompt if in a directory ignored by repo
# GIT_PS1_HIDE_IF_PWD_IGNORED=1

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

# commented out to use new git-prompt stuff from official git
# export PS1="\[\e[32m\]\d\[\e[m\] \[\e[32m\]\t\[\e[m\] \[\e[31m\]\u\[\e[m\]\[\e[34m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]\[\e[34m\]:\[\e[m\]\w\[\e[35m\]\`parse_git_branch\`\[\e[m\] \\$ "

# most of prompt is still from ezprompt.net
export PS1="\[\e[32m\]\d\[\e[m\] \[\e[32m\]\t\[\e[m\] \[\e[31m\]\u\[\e[m\]\[\e[34m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]\[\e[34m\]:\[\e[m\]\w\[\e[35m\]\`(__git_ps1 \"(%s)\")\`\[\e[m\] \\$ "

# end ezprompt.net #
####################


# config for things specific to a company or machine, placed at end to allow
# overrides
if [ -f ~/.bashrc_local ]; then
  echo 'Sourcing ~/.bashrc_local'
  source ~/.bashrc_local
fi

