# General.
SPACESHIP_USER_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_HOST_SHOW_FULL=false
SPACESHIP_HOST_COLOR_SSH=007

# Google Cloud.
SPACESHIP_GCLOUD_SHOW=false

# Kubenetes.
SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_VERSION_SHOW=false
SPACESHIP_KUBECTL_SYMBOL='☸️  '

# Python.
SPACESHIP_VENV_PREFIX='('
SPACESHIP_VENV_SUFFIX=') '

# Docker.
# Setting prefix and suffix for docker_context section
SPACESHIP_DOCKER_CONTEXT_PREFIX="on "
SPACESHIP_DOCKER_CONTEXT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"

# Replacing docker with docker_context
spaceship remove docker
spaceship add docker_context

# Prompts to show.
# SPACESHIP_ASYNC_SHOW_COUNT=true
SPACESHIP_PROMPT_ORDER=(
#  time           # Time stamps section
  user           # Username section
  dir            # Current directory section
  host           # Hostname section
  git            # Git section (git_branch + git_status)
#  hg             # Mercurial section (hg_branch  + hg_status)
  package        # Package version
  node           # Node.js section
#  bun            # Bun section
#  deno           # Deno section
  ruby           # Ruby section
  python         # Python section
#  elm            # Elm section
#  elixir         # Elixir section
  xcode          # Xcode section
  swift          # Swift section
#  golang         # Go section
#  perl           # Perl section
#  php            # PHP section
#  rust           # Rust section
#  haskell        # Haskell Stack section
#  scala          # Scala section
#  kotlin         # Kotlin section
  java           # Java section
  lua            # Lua section
#  dart           # Dart section
#  julia          # Julia section
#  crystal        # Crystal section
  docker         # Docker section
  docker_compose # Docker section
  aws            # Amazon Web Services section
#  gcloud         # Google Cloud Platform section
#  azure          # Azure section
  venv           # virtualenv section
#  conda          # conda virtualenv section
#  dotnet         # .NET section
#  ocaml          # OCaml section
#  vlang          # V section
#  zig            # Zig section
#  purescript     # PureScript section
#  erlang         # Erlang section
  kubectl        # Kubectl context section
#  ansible        # Ansible section
#  terraform      # Terraform workspace section
#  pulumi         # Pulumi stack section
#  ibmcloud       # IBM Cloud section
  nix_shell      # Nix shell
  gnu_screen     # GNU Screen section
  exec_time      # Execution time
  async          # Async jobs indicator
  line_sep       # Line break
#  battery        # Battery level and status
  jobs           # Background jobs indicator
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)
