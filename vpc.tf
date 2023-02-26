resource "digitalocean_vpc" "vpc" {
  name        = "kubernetes"
  region      = var.region
  ip_range    = "10.0.0.0/16"
  description = "Rede Privada Virtual para a comunicação interna do Cluster K8S"
}