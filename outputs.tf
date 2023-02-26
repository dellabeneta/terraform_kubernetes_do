output "ssh_fingerprint" {
  value = digitalocean_ssh_key.ssh_key.fingerprint
}

output "digitalocean_vpc" {
  value = [digitalocean_vpc.vpc.ip_range,
    digitalocean_vpc.vpc.description
  ]
}

/*
output "control_plane_price_hourly" {
  value = digitalocean_droplet.control_plane[*].price_hourly
}

output "control_plane_price_monthly" {
  value = digitalocean_droplet.control_plane[*].price_monthly
}

output "worker_node_price_hourly" {
  value = digitalocean_droplet.worker_node[*].price_hourly
}

output "worker_node_price_monthly" {
  value = digitalocean_droplet.worker_node[*].price_monthly
}
*/

output "control_plane_private_ipv4" {
  value = digitalocean_droplet.control_plane[*].ipv4_address_private
}

output "control_plane_public_ipv4" {
  value = digitalocean_droplet.control_plane[*].ipv4_address
}

output "worker_node_private_ipv4" {
  value = digitalocean_droplet.worker_node[*].ipv4_address_private
}

output "worker_node_public_ipv4" {
  value = digitalocean_droplet.worker_node[*].ipv4_address
}

