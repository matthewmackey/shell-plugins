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
  alias kgctx="kubectl config get-contexts"
  alias krctx="kubectl config rename-context"

  alias kga="kubectl get all"
  alias kgaa="kubectl get all -A"
  alias kd="kubectl describe"


  alias kgcm="kubectl get configmaps"
  alias kgd="kubectl get deployments"
  alias kge="kubectl get endpoints"
  alias kgin="kubectl get ingress"
  alias kgis="kubectl get Issuers"
  alias kgna="kubectl get namespaces"
  alias kgno="kubectl get nodes"
  alias kgp="kubectl get pods"
  alias kgpv="kubectl get persistentvolumes"
  alias kgpvc="kubectl get persistentvolumeclaims"
  alias kgsec="kubectl get secrets"
  alias kgs="kubectl get services"
  alias kgstc="kubectl get storageclasses"

  alias kgdw="kubectl get deployments -o wide"
  alias kgpw="kubectl get pods -o wide"
  alias kgnow="kubectl get nodes -o wide"
  alias kgsw="kubectl get services -o wide"

  alias kcma="kubectl get -A configmaps"
  alias kda="kubectl get -A deployments"
  alias kea="kubectl get -A endpoints"
  alias kina="kubectl get -A ingress"
  alias kisa="kubectl get -A Issuers"
  alias knaa="kubectl get -A namespaces"
  alias knoa="kubectl get -A nodes"
  alias kpoa="kubectl get -A pods"
  alias kpva="kubectl get -A persistentvolumes"
  alias kpvca="kubectl get -A persistentvolumeclaims"
  alias kseca="kubectl get -A secrets"
  alias ksa="kubectl get -A services"
  alias kstca="kubectl get -A storageclasses"

  alias kgdwa="kubectl get -A deployments"
  alias kgnowa="kubectl get -A nodes"
  alias kgpowa="kubectl get -A pods"
  alias kgswa="kubectl get -A services"

  alias kdcm="kubectl describe configmaps"
  alias kdd="kubectl describe deployments"
  alias kde="kubectl describe endpoints"
  alias kdin="kubectl describe ingress"
  alias kdis="kubectl describe Issuers"
  alias kdna="kubectl describe namespaces"
  alias kdno="kubectl describe nodes"
  alias kdpo="kubectl describe pods"
  alias kdpv="kubectl describe persistentvolumes"
  alias kdpvc="kubectl describe persistentvolumeclaims"
  alias kdsec="kubectl describe secrets"
  alias kds="kubectl describe services"
  alias kdstc="kubectl describe storageclasses"

  alias certs="kubectl get Issuers,ClusterIssuers,Certificates,CertificateRequests,Orders,Challenges"

  alias contexts="kubectl config get-contexts | tail -n +2 | awk '{print \$2}'"
  alias logs="kubectl logs"
  alias podcidr="kubectl get nodes -o jsonpath='{.items[*].spec.podCIDR}'"

  #-----------------------
  # K8s Tools
  #-----------------------
  alias kctx="kubectx"
  alias kns="kubens"

# }}}


# vim: set ft=sh foldmarker={{{,}}} foldmethod=marker foldlevel=0 :
