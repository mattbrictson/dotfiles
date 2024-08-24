HISTSIZE=500000
HISTFILESIZE=100000
export HISTIGNORE="&:ls:l:la:ll:exit"

# Rebind ctrl-r with to show smart history search
export MCFLY_RESULTS=16
eval "$(mcfly init bash)"
