# Environment 
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# export KUBECONFIG="${HOME}/.kube/"

# Aliases
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