resource "kubernetes_service_v1" "app" {
  metadata {
    name = "rps-app-service"
  }

  spec {
    selector = {
      app = "rps-app"
    }

    port {
      port        = 80
      target_port = 5000
    }

    type = "LoadBalancer"
  }
}
