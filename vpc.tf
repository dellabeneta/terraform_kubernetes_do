resource "digitalocean_vpc" "vpc" {
  name        = "lab-k8s"
  region      = var.region
  ip_range    = var.vpc_range
  description = "Rede Privada do Cluster K8S"
}