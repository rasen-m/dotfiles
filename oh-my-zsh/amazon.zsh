# /bin/bash

source /Users/seanisu/.brazil_completion/zsh_completion
export DEV_ACCOUNT_ID=992382445274
# export DEV=true

# Aliases - General.
alias .w='cd ~/workplace/'
alias bind='bindkey'
alias .c='ssh seanisu-cloud-desktop.aka.corp.amazon.com'

alias nds='ninja-dev-sync' 
alias auth='mwinit -o && kinit -f' 

alias .a='cat ~/.oh-my-zsh/custom/amazon.zsh'

alias cr-desc="cr --description $HOME/.config/cr/cr-desc.md"

alias adacu='ada_credentials_update() { ada credentials update --account=$1 --provider=conduit --role=IibsAdminAccess-DO-NOT-DELETE --once }; ada_credentials_update'

alias .df='export DEV=false'
alias .dt='export DEV=true'
  
# Aliases - Brazil.
alias b='brazil' 
alias bb='brazil-build' 
alias bba='brazil-build apollo-pkg' # ?
alias bre='brazil-runtime-exec' # ?
  
alias bws='brazil ws' 
alias bwsuse='bws use -p' 
alias bwsremove='bws remove -p' 
alias bwsusev='bws use --versionset' 
alias bwscreate='bws create -n' 
alias bwss='brazil setup platform-support;brazil ws use --platform AL2_x86_64'
alias bwsc='bws --clean' 
  
alias brc='brazil-recursive-cmd' 
alias bbr='brc brazil-build' 
alias bball='brc --allPackages' 
alias bbb='brc --allPackages brazil-build' 
alias bbra='bbr apollo-pkg' # ?
alias sam="brazil-build-tool-exec sam" # ?

# Aliases - Kill. 
alias .kp='killport() { kill -9 $(lsof -t -i:"$1") }; killport'
alias .dc='rm -rf build && rm -rf dist && rm -rf node_modules'

# CDK Completion
autoload -Uz compinit && compinit -i
autoload bashcompinit && bashcompinit
compinit

function _cdk_completer {
  if [[ "$PWD" == *"CDK" ]]; then
    TEMPLATES=$(ls -1 build/cdk.out/*.template.json | awk '{split($0,t,/\/|\./); print t[4]}')
    if [ "$3" ==  "brazil-build" ]; then
      STACK_CMDS="cdk deploy:assets deploy:bootstrap deploy:pipeline diff:pipeline bootstrap clean"
      COMPREPLY=($(compgen -W "$STACK_CMDS" $1))
    elif [ "$3" == "cdk" ]; then
      STACK_CMDS="list synthesize bootstrap deploy destroy diff metadata init context docs doctor"
      COMPREPLY=($(compgen -W "$STACK_CMDS" $2))
    elif [ "$3" == "deploy" ]; then
      STACK_CMDS="$TEMPLATES "
      COMPREPLY=($(compgen -W "--hotswap -e $STACK_CMDS" -- $2))
    else
      COMPREPLY=($(compgen -W "$TEMPLATES" $2))
    fi
  fi
}

complete -F _cdk_completer bb
complete -F _cdk_completer brazil-build
