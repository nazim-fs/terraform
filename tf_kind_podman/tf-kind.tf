resource "kubernetes_namespace" "tf-compose" {
  metadata {
    name = "tf-compose"
  }
}

resource "kubernetes_deployment" "tf-compose-deploy" {
  metadata {
    name = "tf-compose-deploy"
    labels = {
      App = "tf-compose-app"
    }
    namespace = "tf-compose"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        App = "tf-compose-app"
      }
    }

    template {
      metadata {
        labels = {
          App = "tf-compose-app"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "tf-compose-container"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "tf-compose-svc" {
  metadata {
    name      = "tf-compose-svc"
    namespace = "tf-compose"
  }
  spec {
    selector = {
      App = "tf-compose-app"
    }
    port {
      node_port   = 30201
      port        = 80
      target_port = 80
    }
    type = "NodePort"
  }
}
