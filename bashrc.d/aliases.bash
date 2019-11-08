alias b='bundle exec'
alias br='for k in `git branch | sed s/^..//`; do echo -e `git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k --`\\t"$k";done | sort'
alias bup='bundleup'
alias c='clear'
# Change to the root level directory the current git repository
alias cdg='cd $(git rev-parse --show-toplevel || pwd)'
alias diff=colordiff
alias dbundle="$HOME/Code/bundler/bin/bundle"
alias eks='docker run -it -v ~/.aws:/root/.aws -v ~/ekstools:/home/ekstools lirio-docker.jfrog.io/eks-tools-team:0.4.5'
alias find='find -L'
alias gd='git diff'
alias gmas='git fetch -p && git checkout master && git pull'
alias geclipse='./gradlew cleanEclipse eclipse'
alias gl='git log --numstat --oneline'
alias gp='git push'
alias gs='git st'
alias gso='git remote show origin'
alias get='git'
alias gh='git rev-parse --verify --short HEAD'
alias gw="./gradlew --daemon"
alias httpserve='ruby -run -e httpd -- --port=8888 $1'
alias kstat='confluent local status'
alias kstart='confluent local start kafka'
alias kstop='confluent local stop kafka'
alias ktopic='kafka-topics --zookeeper localhost:2181'
alias ls='ls -hFG'
alias l='exa'
alias la='exa -la'
alias ll='exa -l'
alias ls='exa'
alias mark='open -a "Marked 2"'
alias n='npx --no-install'
alias top='top -s 5 -o cpu -stats pid,user,command,cpu,rsize,vsize,threads,state'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias o='open'
alias cdsam='cd ~/source/lirio-ml-sam'
alias trim="tr -s \" \" | sed 's/^[ ]//g'"
alias total-files='ls -1 | wc -l | trim'
alias usage='df -h'
alias space='du -Lsh ./*'
alias wt='title ${PWD##*/}'

# Function for naming terminal windows.
function title {
    echo -ne "\033]0;"$*"\007"
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
