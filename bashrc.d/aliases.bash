alias b='bundle exec'
alias bbc='bucket compare'
alias bup='bundleup'
# Change to the root level directory the current git repository
alias cdg='cd $(git rev-parse --show-toplevel || pwd)'
alias diff=colordiff
alias dbundle="$HOME/Code/bundler/bin/bundle"
alias gco='git co'
alias gs='git st'
alias get='git'
alias gh='hub browse'
alias hl='heroku local'
alias httpserve='ruby -run -e httpd -- --port=8888 $1'
alias ls='ls -hFG'
alias l='exa'
alias la='exa -la'
alias ll='exa -l'
alias ls='exa'
alias n='npx --no-install'
alias ras='bin/rails server -b 0.0.0.0 -p 3000'
alias top='top -s 5 -o cpu -stats pid,user,command,cpu,rsize,vsize,threads,state'

function mcdir() {
  mkdir -p $1 && cd $1
}
