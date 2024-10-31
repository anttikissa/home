# Necessary since .bash_profile runs this (the only way to always run this)
if [ -z "$PS1" ]
then
        echo "Not interactive"
        return
fi

echo [debug] .bashrc

# Disabled mac nag
export BASH_SILENCE_DEPRECATION_WARNING=1

# Settings

# __git_ps1 comes from here
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

START_COLOR="\e[0;32m"
END_COLOR="\e[m"

export PS1="$(__git_ps1 "${START_COLOR}%s${END_COLOR} ")\h:\w\$ "
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

export PATH=$PATH:/opt/homebrew/bin:~/bin:./node_modules/.bin

# Aliases
alias ls='ls -FA --color=tty'
alias l='ls -l'

alias gc='git commit'
alias gdc='git diff --cached'

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

