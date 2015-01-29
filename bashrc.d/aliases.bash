alias b='bundle exec'
# Change to the root level directory the current git repository
alias cdg='cd $(git rev-parse --show-toplevel || pwd)'
alias diff=colordiff
alias get='git'
alias gh='hub browse'
alias ls='ls -hFG'
alias l='ls'
alias la='ls -la'
alias ll='ls -l'
alias top='top -s 5 -o cpu -stats pid,user,command,cpu,rsize,vsize,threads,state'
