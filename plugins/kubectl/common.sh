#-------------------------------------------------------------------------------
# [completion] {{{
#-------------------------------------------------------------------------------
# From oh-my-zsh kubectl plugin
if (( $+commands[kubectl] )); then
  __KUBECTL_COMPLETION_FILE="${ZSH_CACHE_DIR}/kubectl_completion"

  if [[ ! -f $__KUBECTL_COMPLETION_FILE || ! -s $__KUBECTL_COMPLETION_FILE ]]; then
    kubectl completion zsh >! $__KUBECTL_COMPLETION_FILE
  fi

  [[ -f $__KUBECTL_COMPLETION_FILE ]] && source $__KUBECTL_COMPLETION_FILE

  unset __KUBECTL_COMPLETION_FILE
fi

# }}}


#-------------------------------------------------------------------------------
# [aliases]] {{{
#-------------------------------------------------------------------------------
  # General
  alias k="kubectl"
  alias kd="kubectl describe"
  alias kdel="kubectl delete"
  alias kg="kubectl get"
  alias kgw="kubectl get -o wide"
  alias kgwa="kubectl get -o wide -A"

  alias kaf="kubectl apply -f"
  alias kdelf="kubectl delete -f"

  alias keti="kubectl exec -ti"

  # All
  alias kga="kubectl get all"
  alias kgaa="kubectl get all -A"
  alias kgaw="kubectl get all -o wide"
  alias kgawa="kubectl get all -o wide -A"

  # Config
  alias kccc="kubectl config current-context"
  alias kcdc="kubectl config delete-context"
  alias kcgc="kubectl config get-contexts"
  alias kcrc="kubectl config rename-context"
  alias kcsc="kubectl config set-context"
  alias kcuc="kubectl config use-context"

# List all contexts
alias kcgc='kubectl config get-contexts'

  # ConfigMaps
  alias kdcm="kubectl describe configmaps"
  alias kdelcm="kubectl delete configmaps"
  alias kecm="kubectl edit configmaps"
  alias kgcm="kubectl get configmaps"
  alias kgcma="kubectl get configmaps -A"

  # Daemon Sets
  alias kdds="kubectl describe daemonset"
  alias kdelds="kubectl delete daemonset"
  alias keds="kubectl edit daemonset"
  alias kgds="kubectl get daemonset"
  alias kgdsa="kubectl get daemonset -A"
  alias kgdsw="kubectl get daemonset -o wide"
  alias kgdswa="kubectl get daemonset -o wide -A"
  alias kgdswatch="kubectl get daemonset --watch"

  # Deployments
  alias kdd="kubectl describe deployments"
  alias ked="kubectl edit deployments"
  alias kgd="kubectl get deployments -o wide"
  alias kgda="kubectl get deployments -A"
  alias kgdw="kubectl get deployments -o wide"
  alias kgdwa="kubectl get deployments -o wide -A"

  # Endpoints
  alias kde="kubectl describe endpoints"
  alias kge="kubectl get endpoints"
  alias kgea="kubectl get endpoints -A"

  # Ingress
  alias kdin="kubectl describe ingress"
  alias kein="kubectl edit ingress"
  alias kgin="kubectl get ingress"
  alias kgina="kubectl get ingress -A"

  # Issuers
  alias kdis="kubectl describe Issuers"
  alias kgis="kubectl get Issuers"
  alias kgisa="kubectl get Issuers -A"

  # Logs
  alias kl="kubectl logs"
  alias kl1h="kubectl logs --since 1h"
  alias kl1m="kubectl logs --since 1m"
  alias kl1s="kubectl logs --since 1s"
  alias klf="kubectl logs -f"
  alias klf1h="kubectl logs --since 1h -f"
  alias klf1m="kubectl logs --since 1m -f"
  alias klf1s="kubectl logs --since 1s -f"

  # Namespaces
  alias kdna="kubectl describe namespaces"
  alias kdelna="kubectl delete namespaces"
  alias kena="kubectl edit namespaces"
  alias kgna="kubectl get namespaces"
  alias kgnaa="kubectl get namespaces -A"

  # Nodes
  alias kdno="kubectl describe nodes"
  alias kgno="kubectl get nodes"
  alias kgnoa="kubectl get nodes -A"
  alias kgnow="kubectl get nodes -o wide"
  alias kgnowa="kubectl get -A nodes -o wide -A"

  # Pods
  alias kdp="kubectl describe pods"
  alias kdelp="kubectl delete pods"
  alias kep="kubectl edit pods"
  alias kgp="kubectl get pods"
  alias kgpa="kubectl get pods -A"
  alias kgpw="kubectl get pods -o wide"
  alias kgpwa="kubectl get pods -o wide"
  alias kgpwatch="kubectl get pods --watch"
  alias kgps="kubectl get pods --selector"

  # PersistentVolumes
  alias kdpv="kubectl describe persistentvolumes"
  alias kdelpv="kubectl delete persistentvolumes"
  alias kgpv="kubectl get persistentvolumes"
  alias kgpva="kubectl get persistentvolumes -A"

  # PersistentVolumeClaims
  alias kdpvc="kubectl describe persistentvolumeclaims"
  alias kdelpvc="kubectl delete persistentvolumeclaims"
  alias kgpvc="kubectl get persistentvolumeclaims"
  alias kgpvca="kubectl get persistentvolumeclaims -A"

  # Services
  alias kds="kubectl describe services"
  alias kdels="kubectl delete services"
  alias kes="kubectl edit services"
  alias kgs="kubectl get services"
  alias kgsa="kubectl get services -A"
  alias kgsw="kubectl get services -o wide"
  alias kgswa="kubectl get services -o wide -A"

  # Secrets
  alias kdsec="kubectl describe secrets"
  alias kdelsec="kubectl delete secrets"
  alias kesec="kubectl edit secrets"
  alias kgsec="kubectl get secrets"
  alias kgseca="kubectl get secrets -A"

  # Stateful Sets
  alias kdss="kubectl describe statefulset"
  alias kdelss="kubectl delete statefulset"
  alias kess="kubectl edit statefulset"
  alias kgss="kubectl get statefulset"
  alias kgssa="kubectl get statefulset -A"
  alias kgssw="kubectl get statefulset -o wide"
  alias kgsswa="kubectl get statefulset -o wide -A"
  alias kgsswatch="kubectl get statefulset --watch"

  # StorageClasses
  alias kdsc="kubectl describe storageclasses"
  alias kgsc="kubectl get storageclasses"
  alias kgsca="kubectl get storageclasses -A"

  #-----------------------
  # Random
  #-----------------------
  alias certs="kubectl get Issuers,ClusterIssuers,Certificates,CertificateRequests,Orders,Challenges"
  alias contexts="kubectl config get-contexts | tail -n +2 | awk '{print \$2}'"
  alias podcidr="kubectl get nodes -o jsonpath='{.items[*].spec.podCIDR}'"

  #-----------------------
  # K8s Tools
  #-----------------------
  alias kctx="kubectx"
  alias kns="kubens"

# }}}


# vim: set ft=sh foldmarker={{{,}}} foldmethod=marker foldlevel=0 :
