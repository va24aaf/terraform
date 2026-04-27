resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "rpsaks"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_size
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = all
  }
}


resource "kubernetes_deployment_v1" "app" {
  metadata {
    name = "rps-app"
    labels = {
      app = "rps-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "rps-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "rps-app"
        }
      }

      spec {
        container {
          name  = "rps-app"
          image = var.image

          port {
            container_port = 5000
          }
        }
      }
    }
  }
}
