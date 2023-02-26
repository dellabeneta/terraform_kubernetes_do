resource "digitalocean_vpc" "vpc" {
  name        = "kubernetes"
  region      = var.region
  ip_range    = "10.0.0.0/24"
  description = "Rede Privada comunicação interna do Cluster K8S"
}

