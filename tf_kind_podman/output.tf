output "Service_ID" {
  description = "Service ID"
  value       = kubernetes_service.tf-compose-svc.id
}

output "cluster_ip" {
  description = "Cluster IPs"
  value       = kubernetes_service.tf-compose-svc.spec.0.cluster_ip
}
