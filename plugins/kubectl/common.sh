#-------------------------------------------------------------------------------
# [Kubeconfig File Management] {{{
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------
# ekubeconfig
#
# Updates your ~/.kube/config symlink to the provide kubeconfig file
# so that your `kubectl` commands will apply to the same cluster
# across all of your shell windows.
#
# OPTIONS
#
#  -e  if you provide this as the 2nd argument to this command
#      then it will only set the KUBECONFIG environment variable
#      in your current shell so that your `kubectl` commands will
#      only run against the cluster you specify in the shell only
#-------------------------------------------------------------------
ekubeconfig() {
  local kubeconfig_path=$1
  local set_kubeconfig_only=${2:-NO}

  if [ -z "$kubeconfig_path" ] || [ ! -f $kubeconfig_path -a ! -L $kubeconfig_path ]; then
    printf "You must provide a valid path\n"
    return 1
  fi

  if [ "$set_kubeconfig_only" != "-e" ]; then
    if [ -e ~/.kube/config -a ! -L ~/.kube/config ]; then
      printf "Cannot proceed becuase ~/.kube/config is not a symlink and we can't delete it\n"
      return 1
    fi

    printf "Setting ~/.kube/config -> $kubeconfig_path\n"
    if [ -e ~/.kube/config ]; then
      rm ~/.kube/config
    fi

    ln -s $kubeconfig_path ~/.kube/config
  else
    printf "Setting KUBECONFIG=$kubeconfig_path\n"
    export KUBECONFIG=$kubeconfig_path
  fi
}

# }}}


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
  create_std_k8s_aliases() {
    local _abbrev=$1
    local _resource=$2

    # kg_
    alias kg${_abbrev}="kubectl get $_resource"

    # kg_l
    alias kg${_abbrev}l="kubectl get $_resource --show-labels"

    # kg_a
    alias kg${_abbrev}a="kubectl get $_resource -A"

    # kg_al
    alias kg${_abbrev}al="kubectl get $_resource -A --show-labels"

    # kg_w
    alias kg${_abbrev}w="kubectl get $_resource -o wide"

    # kg_wl
    alias kg${_abbrev}wl="kubectl get $_resource -o wide --show-labels"

    # kg_wa
    alias kg${_abbrev}wa="kubectl get $_resource -o wide -A"

    # kg_wal
    alias kg${_abbrev}wal="kubectl get $_resource -o wide -A --show-labels"

    # kg_watch
    alias kg${_abbrev}watch="kubectl get $_resource --watch"

    # kd_
    alias kd${_abbrev}="kubectl describe $_resource"

    # kdel_
    alias kdel${_abbrev}="kubectl delete $_resource"

    # kdel_l
    alias kdel${_abbrev}l="kubectl delete $_resource -l"

    # ke_
    alias ke${_abbrev}="kubectl edit $_resource"

  }

  # General
  alias k="kubectl"
  alias kd="kubectl describe"
  alias kdel="kubectl delete"
  alias kg="kubectl get"
  alias kgw="kubectl get -o wide"
  alias kgwa="kubectl get -o wide -A"

  alias kk="kubectl krew"

  # File Operations
  alias kaf="kubectl apply -f"
  alias kdelf="kubectl delete -f"

  # Exec Operations
  alias keti="kubectl exec -ti"

  # Port Forward
  alias kpf="kubectl port-forward"
  alias kpfs="kubectl port-forward service/"

  # Proxy
  alias kproxy="kubectl proxy"

  # Run
  alias krun="kubectl run -it --rm"

  #-------------------------------------------------------
  # Resource Operations
  #-------------------------------------------------------

  # All
  _EXTRA_RESOURCES="configmaps,secrets,ingress"
  alias kga="kubectl get all"
  alias kgax="kubectl get all,$_EXTRA_RESOURCES"

  # all -A
  alias kgaa="kubectl get all -A"
  alias kgaax="kubectl get all,$_EXTRA_RESOURCES -A"

  # all -o wide
  alias kgaw="kubectl get all -o wide"
  alias kgawx="kubectl get all,$_EXTRA_RESOURCES -o wide"

  # all -A -o wide
  alias kgaaw="kubectl get all -A -o wide"
  alias kgaawx="kubectl get all,$_EXTRA_RESOURCES -A -o wide"
  unset _EXTRA_RESOURCES

  # Config
  alias kccc="kubectl config current-context"
  alias kcdcluster="kubectl config delete-cluster"
  alias kcdcontext="kubectl config delete-context"
  alias kcduser="kubectl config delete-user"
  alias kcgclusters="kubectl config get-clusters"
  alias kcgcontexts="kubectl config get-contexts"
  alias kcgusers="kubectl config get-users"
  alias kcrcontext="kubectl config rename-context"
  alias kcscontext="kubectl config set-context"
  alias kcuccontext="kubectl config use-context"
  alias kcview="kubectl config view"

  # Events
  alias kge="kubectl get events"
  alias kgew="kubectl get events --watch"

  # Logs
  alias kl="kubectl logs"
  alias kl1h="kubectl logs --since 1h"
  alias kl1m="kubectl logs --since 1m"
  alias kl1s="kubectl logs --since 1s"
  alias klf="kubectl logs -f"
  alias klft="kubectl logs -f --tail=-1"
  alias klf1h="kubectl logs --since 1h -f"
  alias klf1m="kubectl logs --since 1m -f"
  alias klf1s="kubectl logs --since 1s -f"

  alias klin="kubectl logs -l app.kubernetes.io/component=controller,app.kubernetes.io/instance=ingress-nginx,app.kubernetes.io/name=ingress-nginx"
  alias klinf="klin -f"
  alias klinft="klin -f --tail=-1"

  # Rollout
  alias krr="kubectl rollout restart"
  alias krrds="kubectl rollout restart daemonset"
  alias krrd="kubectl rollout restart deployments"


  # Standard
  create_std_k8s_aliases cm  configmaps
  create_std_k8s_aliases ds  daemonsets
  create_std_k8s_aliases d   deployments
  create_std_k8s_aliases en  endpoints
  create_std_k8s_aliases in  ingress
  create_std_k8s_aliases na  namespaces
  create_std_k8s_aliases no  nodes
  create_std_k8s_aliases p   pods
  create_std_k8s_aliases pv  persistentvolumes
  create_std_k8s_aliases pvc persistentvolumeclaims
  create_std_k8s_aliases s   services
  create_std_k8s_aliases sec secrets
  create_std_k8s_aliases ss  statefulsets
  create_std_k8s_aliases sc  storageclasses

  # cert-manager.io
  create_std_k8s_aliases crt certificates
  create_std_k8s_aliases req certificaterequests
  create_std_k8s_aliases is  issuers

  # cstor.openebs.io
  create_std_k8s_aliases cspc cstorpoolclusters
  create_std_k8s_aliases cspi cstorpoolinstances
  create_std_k8s_aliases csv  cstorvolumes
  create_std_k8s_aliases csva cstorvolumeattachments
  create_std_k8s_aliases csvc cstorvolumeconfigs
  create_std_k8s_aliases csvp cstorvolumepolicies
  create_std_k8s_aliases csvr cstorvolumereplicas

  # openebs.io
  create_std_k8s_aliases bd  blockdevices
  create_std_k8s_aliases bdc blockdeviceclaims

  # EXTRA
  alias kgps="kubectl get pods --selector"

  alias kgpsort="kgp --sort-by '{.spec.nodeName}'"
  alias kgpasort="kgpa --sort-by '{.spec.nodeName}'"

  alias kgpwsort="kgpw --sort-by '{.spec.nodeName}'"
  alias kgpwasort="kgpwa --sort-by '{.spec.nodeName}'"


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
