# /bin/bash

# Functions
function _ada_completer {
	local first_password='get fucking fit'
	expect -c "
		spawn mwinit -o
		expect \"PIN for seanisu:\"
		send \"$first_password\r\"
		interact
	"
}

# Aliases - General.
alias .w='cd ~/workplace/'
alias bind='bindkey'

alias nds='ninja-dev-sync' 
alias auth='mwinit -o && kinit -f' 

alias .a='cat ~/.oh-my-zsh/custom/amazon_aliases.zsh'

alias cr-desc="cr --description $HOME/.config/cr/cr-desc.md"

alias adacu='ada_credentials_update() { ada credentials update --account=$1 --provider=conduit --role=IibsAdminAccess-DO-NOT-DELETE --once }; ada_credentials_update'
alias adacu_hydra='ada_credentials_update_hydra() { ada credentials update --account=$1 --provider=conduit --role=IibsAdminAccess-DO-NOT-DELETE --once --profile HydraCLIProfile }; ada_credentials_update_hydra'

# alias .1='mwinit -o' 
alias .1='_ada_completer'
alias .2='adacu 992382445274'
alias .22='adacu_hydra 992382445274'
alias .3='ada credentials serve --account 992382445274 --provider=conduit --role=IibsAdminAccess-DO-NOT-DELETE'
alias .0='ssh seanisu-cloud-desktop.aka.corp.amazon.com'
 
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
alias sam='brazil-build-tool-exec sam' # ?
alias gg='brc --allPackages git'

# Aliases - Kill. 
alias .kp='killport() { kill -9 $(lsof -t -i:"$1") }; killport'
alias .dc='rm -rf build && rm -rf dist && rm -rf node_modules'

# Additional Team Aliases.
alias .mes='cd $HOME/workplace/SeasonalEventsMetadataService/src'
alias .mcms='cd $HOME/workplace/MarketingContentManagementService/src'
alias .m3s='cd $HOME/workplace/MarketingMerchandizingManagementService/src'

alias .cdk='cd *CDK'
