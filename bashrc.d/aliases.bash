alias b='bundle exec'
alias br='for k in `git branch | sed s/^..//`; do echo -e `git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k --`\\t"$k";done | sort'
alias bup='bundleup'
alias cl='clear'
alias c='ccat'
# Change to the root level directory the current git repository
alias cdg='cd $(git rev-parse --show-toplevel || pwd)'
alias cdw='cd `find . -type d -name webapp`'
alias diff=colordiff
alias dbundle="$HOME/Code/bundler/bin/bundle"
alias find='find -L'
alias gd='git diff'
alias gmas='git fetch -p && git checkout master && git pull'
alias git-behind='git rev-list --left-right --count origin/master...@'
alias eks='docker run -it -v ~/.aws:/root/.aws -v ~/ekstools:/home/ekstools -v ~/.bash_history_eks-tools:/root/.bash_history lirio-docker.jfrog.io/eks-tools-team:0.4.5'
alias find='find -L'
alias gd='git diff'
alias gm='git fetch -p && git checkout main && git pull && git prune-branches'
alias gpb='git prune-branches'
alias git-behind='git rev-list --left-right --count origin/main...@'
alias gl='git log --numstat --oneline'
alias gp='git push'
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
alias n='npx --no-install'
alias gwsonar='gw check sonarqube -Dsonar.login=21dd92c46fa2da02f8f26e26e3be26170817f542 -Dsonar.host.url=http://localhost:9000'
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

# Function for naming terminal tabs
function title {
    echo -ne "\e]1;"$*"\a"
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
