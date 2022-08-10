alias bi='HOMEBREW_NO_AUTO_UPDATE=1 brew install'
alias bu='HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade'
alias br='for k in `git branch | sed s/^..//`; do echo -e `git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k --`\\t"$k";done | sort'
alias c='clear'
alias cat='ccat'
# Change to the root level directory the current git repository
alias cdg='cd $(git rev-parse --show-toplevel || pwd)'
alias cdw='cd `find . -type d -name webapp`'
alias diff=colordiff
alias find='find -L'
alias gd='git diff'
alias git-behind='git rev-list --left-right --count origin/main...@'
alias gm='git fetch -p && git checkout main && git pull'
alias gpb='git prune-branches'
alias gl='git log --numstat --oneline'
alias gp='git push'
alias gpb='git prune-branches'
alias gs='git st'
alias gso='git remote show origin'
alias get='git'
alias gh='git rev-parse --verify --short HEAD'
alias gw="./gradlew --daemon"
alias jjs='java -jar -Dspring.profiles.active=local `find . -name "*service*.jar"`'
alias jjw='java -jar -Dspring.profiles.active=local `find . -name "*worker*.jar"`'
alias ls='ls -hFG'
alias l='exa'
alias la='exa -la'
alias ll='exa -l'
alias ls='exa'
alias mark='open -a "Marked 2"'
alias mk='minikube'
alias n='npx --no-install'
alias top='top -s 5 -o cpu -stats pid,user,command,cpu,rsize,vsize,threads,state'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias o='open'
alias trim="tr -s \" \" | sed 's/^[ ]//g'"
alias total-files='ls -1 | wc -l | trim'
alias usage='df -h'
alias space='du -Lsh ./*'
alias wt='title ${PWD##*/}'

# Kubernetes CLI specific stuff
alias pods='kubectl get pods -o wide'
alias k='kubectl'
alias kg='kubectl get'
alias kgpod='kubectl get pod'
alias kgall='kubectl get --all-namespaces all'
alias kdp='kubectl describe pod'
# kubectl apply
alias kap='kubectl apply'
# kubectl delete
alias krm='kubectl delete'
alias krmf='kubectl delete -f'
# kubectl services
alias kgsvc='kubectl get service'
# kubectl deployments
alias kgdep='kubectl get deployments'
# kubectl misc
alias kl='kubectl logs'
alias kei='kubectl exec -it'

# Function for naming terminal tabs
function title {
    # echo -ne "\e]1;"$*"\a"
    echo -e "\033];"$*"\007"
}

function mcdir() {
  mkdir -p $1 && cd $1
}

# Function to show whole file name with path
function trail {
  echo "$(pwd)/$1"
}

# Function to show just folder names
function dirs {
  for file in `ls`; do
    if [  -d $file ]; then
      echo $file
    fi
  done
}
