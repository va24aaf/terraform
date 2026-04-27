variable "resource_group_name" {
  default = "rps-aks-rg"
}

variable "location" {
  default = "UK South"
}

variable "cluster_name" {
  default = "rps-aks-cluster"
}

variable "node_count" {
  default = 2
}

variable "node_size" {
  default = "Standard_D2lds_v6"
}

variable "image" {
  default = "adeliah/rps-app:latest"
}
