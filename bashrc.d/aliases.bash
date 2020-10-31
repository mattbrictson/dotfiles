alias b='bundle exec'
alias bup='bundleup'
alias cat='bat'
# Change to the root level directory the current git repository
alias cdg='cd $(git rev-parse --show-toplevel || pwd)'
alias diff=colordiff
alias gb='gh pr view --web > /dev/null 2>&1 || hub browse'
alias get='git'
alias hl='heroku local -p 3000 $(test -f Procfile.dev && echo "-f Procfile.dev")'
alias httpserve='ruby -run -e httpd -- --port=8888 $1'
alias l='exa'
alias la='exa -la'
alias ll='exa -l'
alias ls='exa'
alias ls='ls -hFG'
alias n='npx --no-install'
alias ras='bin/rails server -b 0.0.0.0 -p 3000'
alias rtt="if [ -x bin/rails ]; then retest 'bin/rails test TEST=<test>'; else retest 'bundle e rake test TEST=<test>'; fi"
alias s="git sw"
alias secret="ruby -rsecurerandom -e 'puts SecureRandom.hex(64)'"
alias top='top -s 5 -o cpu -stats pid,user,command,cpu,rsize,vsize,threads,state'
alias uuid="ruby -rsecurerandom -e 'puts SecureRandom.uuid'"
alias ys="yarn start"

function mcdir() {
  mkdir -p $1 && cd $1
}
