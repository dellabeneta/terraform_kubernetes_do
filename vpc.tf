resource "digitalocean_vpc" "vpc" {
  name        = "lab-k8s"
  region      = var.region
  ip_range    = "192.168.1.0/24"
  description = "Rede Privada do Cluster K8S"
}