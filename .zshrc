alias edith='sudo vim /etc/hosts'
alias editp='vim ~/.bash_profile'
alias renpm='rm -rf node_modules/ && npm install'
alias refresh='renpm && npm start'
alias cleanup='npm prune && npm update'
alias wport='lsof -i'

# Point to work folder
alias cdc='cd ~/Code'
alias cdi='cd ~/Code/internal'
alias cdp='cd ~/Code/personal'
alias cds='cd ~/Code/sandbox'
alias cdg='cd ~/go/src/github.com/sendgrid'

# more PATH adjustments
export PATH=$PATH:$HOME/bin # user bin directory
export PATH="/$HOME/.gem/ruby/2.3.0/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# export GOROOT=/usr/local/Cellar/go/1.12.5/libexec
# export PATH=$GOROOT/bin:$PATH
# export GOPATH="$HOME/go"
# export PATH=$PATH:$GOPATH/bin

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

GREEN="\[\e[0;32m\]"
BLUE="\[\e[0;34m\]"
RED="\[\e[0;31m\]"
BRED="\e[1;31m\]"
YELLOW="\[\e[0;33m\]"
WHITE="\e[0;37m\]"
BWHITE="\e[1;37m\]"
COLOREND="\[\e[00m\]"

# Start rbnev
eval "$(rbenv init -)"

# Persist aws-okta role
function assume {
	eval $(aws-okta exec $1 -- env | grep AWS_ | sed -e 's/^/export /g')
}

# NVM Bash Completion
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST

# cfreeman@cfreeman marketing-campaigns (CAMP-2154) $
PROMPT='%F{white}%n@%m %F{10}%1d %F{11}${vcs_info_msg_0_}%F{white}$ '
# PROMPT='(╯°□°)╯︵ ┻━┻ %F{10}%1d %F{11}${vcs_info_msg_0_}%F{white}$ '

function aosg {
        export AWS_PROFILE=eng-mc
#        cp ~/.aws/config.sendgrid ~/.aws/config
        /usr/local/Cellar/aws-okta/1.0.4/bin/aws-okta exec $1 -- ${@:2}
}
function aosegment {
        unset AWS_PROFILE
        cp ~/.aws/config.segment  ~/.aws/config
        /usr/local/Cellar/segment-aws-okta/1.0.1_1/bin/aws-okta exec $1 -- ${@:2}
}

function onbehalf {
[ -z "$1" ] && echo "Enter a valid user id" && return 1
payload='{"version":1,"subject_type":"user","subject_id":"'$1'","sso_connection_id":"","is_mfa":false}'
openssl enc -A -base64 <<< $payload
}

