# /bin/bash

# Sources.
source $HOME/.brazil_completion/zsh_completion

# Exports.
export DEV_ACCOUNT_ID=992382445274

export PATH=$HOME/.toolbox/bin:$PATH
export PATH=/apollo/env/envImprovement/bin:$PATH

export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"

# CDK Completion.
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
