alias b='bundle exec'
alias bbc='bucket compare'
alias bup='bundleup'
alias cat='bat'
# Change to the root level directory the current git repository
alias cdg='cd $(git rev-parse --show-toplevel || pwd)'
alias dbundle="$HOME/Code/bundler/bin/bundle"
alias diff=colordiff
alias gb='hub browse'
alias gco='git co'
alias get='git'
alias gs='git st'
alias hl='heroku local $(test -f Procfile.dev && echo "-f Procfile.dev")'
alias httpserve='ruby -run -e httpd -- --port=8888 $1'
alias l='exa'
alias la='exa -la'
alias ll='exa -l'
alias ls='exa'
alias ls='ls -hFG'
alias n='npx --no-install'
alias ras='bin/rails server -b 0.0.0.0 -p 3000'
alias record="npx terminalizer --config $(readlink $HOME/.terminalizer/config.yml) record"
alias rgi="rg $1 -g '!*.lock'"
alias secret="ruby -rsecurerandom -e 'puts SecureRandom.hex(64)'"
alias top='top -s 5 -o cpu -stats pid,user,command,cpu,rsize,vsize,threads,state'
alias uuid="ruby -rsecurerandom -e 'puts SecureRandom.uuid'"

function mcdir() {
  mkdir -p $1 && cd $1
}
