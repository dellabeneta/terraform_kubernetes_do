resource "digitalocean_droplet" "control_plane" {
  count    = 1
  image    = "ubuntu-22-04-x64"
  name     = "control-plane-${count.index}"
  region   = var.region
  size     = var.droplet_size
  ssh_keys = [digitalocean_ssh_key.ssh_key.id]
  vpc_uuid = digitalocean_vpc.vpc.id
}