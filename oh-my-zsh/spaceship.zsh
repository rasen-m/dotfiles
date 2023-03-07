ZSH_THEME=""
source "/opt/homebrew/opt/spaceship/spaceship.zsh"

SPACESHIP_PROMPT_ADD_NEWLINE=false

SPACESHIP_GCLOUD_SHOW=false

SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_VERSION_SHOW=false
SPACESHIP_KUBECTL_SYMBOL='☸️  '

# Setting prefix and suffix for docker_context section
SPACESHIP_DOCKER_CONTEXT_PREFIX="on "
SPACESHIP_DOCKER_CONTEXT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"

# Replacing docker with docker_context
spaceship remove docker
spaceship add docker_context
