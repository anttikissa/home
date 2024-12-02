# 1. Aliases (first because most often changed)
alias ls='ls -FA --color=tty'
alias l='ls -l'

alias gc='git commit'
alias gdc='git diff --cached'
alias gsh='git show'

# 2. Path (because second most often changed)
export PATH=$PATH:/opt/homebrew/bin:~/bin:./node_modules/.bin:/Applications/WebStorm.app/Contents/MacOS

#
# And the rest...
# 

# Necessary since .bash_profile runs this (the only way to always run this)
if [ -z "$PS1" ]
then
        echo "Not interactive"
        return
fi

echo [debug] .bashrc

# Disable mac nag
export BASH_SILENCE_DEPRECATION_WARNING=1

# Prompt
# __git_ps1 comes from here
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
START_COLOR="\e[0;32m"
END_COLOR="\e[m"
export PS1="$(__git_ps1 "${START_COLOR}%s${END_COLOR} ")\h:\w\$ "

# Trick to change root prompt (root .profile doesn't work, etc)
sudo() {
	PS1_OLD=$PS1
	export PS1="[root] \w# "
	/usr/bin/sudo "$@"
	PS1=$PS1_OLD
}

# Random stuff
eval "$(scmpuff init --shell=sh)"

cat .todo

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
