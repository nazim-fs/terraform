terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.11.0"
    }

    kind = {
      source  = "justenwalker/kind"
      version = "0.12.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-kind"
}

provider "kind" {
  provider   = "podman"
  kubeconfig = pathexpand("~/.kube/config")
}
