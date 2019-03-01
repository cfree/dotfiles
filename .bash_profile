alias edith='sudo vim /etc/hosts'
alias editp='vim ~/.bash_profile'
alias cds='cd ~/Sites'
alias cdn='cd ~/Notes'
alias cdwp='cd ~/Sites/personal/vagrant-local/www/'
alias rebower='bower cache clean && rm -rf bower_components/ && bower install'
alias renpm='rm -rf node_modules/ && npm install'
alias refresh='renpm && npm start'
alias cleanup='npm prune && npm update'
alias dcwp='docker-compose exec --user www-data phpfpm wp'
alias wpup='docker-compose -f docker-compose.yml -f admin-compose.yml up'

# Point to current work folder
alias cdc='cd ~/Sites/clients'
alias cdi='cd ~/Sites/internal'
alias cdb='cd ~/Sites/sandbox'

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# more PATH adjustments
export PATH=$PATH:$HOME/bin # user bin directory
export PATH="/usr/local/sbin:$PATH"
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
export GOPATH=$HOME/.go

GREEN="\[\e[0;32m\]"
BLUE="\[\e[0;34m\]"
RED="\[\e[0;31m\]"
BRED="\e[1;31m\]"
YELLOW="\[\e[0;33m\]"
WHITE="\e[0;37m\]"
BWHITE="\e[1;37m\]"
COLOREND="\[\e[00m\]"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Git Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export PS1="\u@\h \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
# export PS1="(╯°□°)╯︵ ┻━┻ \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"
# Vagrant
export PATH=$PATH:$HOME/.vv

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/craigf/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/craigf/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/craigf/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/craigf/Downloads/google-cloud-sdk/completion.bash.inc'; fi
