# Load nvm and its completions
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

### PATH

# Add all personal scripts
export PATH=~/dev/scripts:$PATH

# Add google-cloud-sdk (gcloud)
export PATH=~/Installed_Programs/google-cloud-sdk/bin:$PATH
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dandan.drori/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dandan.drori/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/dandan.drori/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dandan.drori/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Choose Plugins
plugins=(fzf zsh-interactive-cd)

### FZF
export FZF_BASE="/usr/local/Cellar/fzf/0.29.0"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs--bind "shift-up:preview-up,shift-down:preview-down"'
export DISABLE_FZF_KEY_BINDINGS="true"
export FZF_DEFAULT_OPTS='--height 96% --reverse --preview="bat --color=always --style=plain {} --line-range :30"'

# enable auto-complete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 

# run ls after each cd
autoload -U add-zsh-hook
add-zsh-hook -Uz chpwd (){ ls; }

# enable auto cd
setopt autocd

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{magenta}%(4~|.../%3~|%~) %F{red}${vcs_info_msg_0_} %F{green}$%F{reset_color} '
# with name first - PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '

### ALIASES

# general
alias c="clear"
alias q="exit"
alias ..="cd .."
alias la="ls -a"
alias ll="ls -al"
alias myip="ifconfig | grep broadcast | awk '{print \$2}'" 
alias mystorage="df -h | awk '{if (NR<5 && NR!=3 && NR!=2) print}'"
alias code="~/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias py="python3"
alias growui="webstorm ~/dev/projects/dozi/dozi-apps-web-growui-ng5"
alias growbe="webstorm ~/dev/projects/dozi/dozi-apps-web-nodebackend"
alias '9'="cd ~/dev/projects/team-9"
alias w="webstorm ."
alias zshrc="vim ~/.zshrc"
alias f='cd $(dirname $(rg --files -g "!{node_modules,.git,Documents,Pictures,Desktop,Library,Movies,Music,Applications,Public,Installed_Programs}" | fzf))'
alias v='vim $(rg --files -g "!{node_modules,.git,Documents,Pictures,Desktop,Library,Movies,Music,Applications,Public,Installed_Programs}" | fzf)'
alias o='open $(dirname $(rg --files -g "!{node_modules,.git,Documents,Pictures,Desktop,Library,Movies,Music,Applications,Public,Installed_Programs}" | fzf))'

# git
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gcb="git checkout -b"
alias gpu="git pull"
alias grmb="git branch | egrep -v 'master|staging' | xargs git branch -D"

# scripts
alias script="script.sh"
alias '2048'="2048.sh"
alias binit="git pull && npm i"

# functions
function init() {
    if [ "$1" == "ui" ]
    then
        git pull && npm i && npm run dev-local
    fi
    if [ "$1" == "anura" ]
    then
        git pull && npm i && npm run staging2
    fi
}

function acp() {
  git add .
  git commit -m "$1"
  git push
}
