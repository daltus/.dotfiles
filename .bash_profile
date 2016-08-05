# Dalton Petursson's Bash Profile


# Aliases
alias ~="cd ~"
alias ..="cd .."
alias cd..="cd .."
alias ls="ls -Gp"
alias lsd="ls -alh"
alias psdl="ps auxwww | less"
alias c='clear'
alias vims='vim -S'

# Editor of choice
export EDITOR=vim

# git aliases
alias glg="git log --oneline --abbrev-commit --all --graph --decorate"
alias gs="git status"

# git completion
source ~/.dotfiles/git-completion.bash


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

export PS1="\[\e[34m\]\d\[\e[m\] \[\e[34m\]\t\[\e[m\] \[\e[35m\]\u\[\e[m\]\[\e[34m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]:\[\e[31m\]\W\[\e[m\]\[\e[36m\]\`parse_git_branch\`\[\e[m\] $ "

# end ezprompt.net #
####################


# config for things specific to a company or machine, placed at end to allow
# overrides
source ~/.bash_profile_local
