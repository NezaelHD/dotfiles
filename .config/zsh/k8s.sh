KUBE_PATH="$HOME/.kube"

export KUBECONFIG="$KUBE_PATH/current"
export KUBE_PS1_NS_ENABLE=false
export KUBE_PS1_SYMBOL_ENABLE=false

CONFIGS_PATH="$KUBE_PATH/config"
AVAILABLE_CONFIGS="$(find "$CONFIGS_PATH" -type f -printf "%f ") none"

kube() {
  kubeon


  if [[ "$1" == "-h" ]]; then
    echo "Usage: $0 [config]"
    echo "If config is not provided or equals to 'none', unload kube config"
    echo "Available configs: $AVAILABLE_CONFIGS"
    return
  fi

  if [[ "$1" == "none" || "$1" == "" ]]; then
    if [[ -f "$KUBECONFIG" ]]; then
      rm "$KUBECONFIG" 2>/dev/null
    fi

    kubeoff
    return
  fi

  CONFIG="$CONFIGS_PATH/$1"
  if [[ ! -f "$CONFIG" ]]; then
    echo "Config $1 does not exist"
    return
  fi

  if [[ "$1" == *"preprod"* ]]; then
    KUBE_PS1_CTX_COLOR=yellow
  else
    if [[ "$1" == *"prod"* ]]; then
      KUBE_PS1_CTX_COLOR=red
    else
      KUBE_PS1_CTX_COLOR=green
    fi
  fi

  cp "$CONFIG" "$KUBE_PATH/current"
  chmod 600 "$KUBE_PATH/current"
}

_kube_completion() {
  COMPREPLY=($AVAILABLE_CONFIGS)
}

alias k="kubectl"

source <(kubectl completion zsh)
source "$KUBE_PATH/scripts/kube_ps1.sh"
kube $(k config current-context 2>/dev/null)
complete -F _kube_completion -o default kube

k8s_exec() {
  if [[ "$1" == "-h" || "$#" -lt 2 ]]; then
    echo "Usage: $0 [namespace] [pod name] [command]"
    return
  fi

  NAMESPACE="$1"
  POD_NAME="$2"

  POD=$(kubectl -n "$NAMESPACE" get pods | grep "^$POD_NAME" | head -n 1 | cut -d " " -f 1)
  kubectl exec -it -n "$NAMESPACE" "$POD" -- "${@: 3}"
}
