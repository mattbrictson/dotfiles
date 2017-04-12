alias b='bundle exec'
alias bup='bundleup'
# Change to the root level directory the current git repository
alias cdg='cd $(git rev-parse --show-toplevel || pwd)'
alias diff=colordiff
alias gco='git co'
alias gs='git st'
alias get='git'
alias gh='hub browse'
alias httpserve='ruby -run -e httpd -- --port=8888 $1'
alias ls='ls -hFG'
alias l='ls'
alias la='ls -la'
alias ll='ls -l'
alias top='top -s 5 -o cpu -stats pid,user,command,cpu,rsize,vsize,threads,state'

function mcdir() {
  mkdir -p $1 && cd $1
}
