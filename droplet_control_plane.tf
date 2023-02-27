resource "digitalocean_droplet" "control_plane" {
  image    = "ubuntu-22-04-x64"
  name     = "control-plane"
  region   = var.region
  size     = var.droplet_size
  ssh_keys = [digitalocean_ssh_key.ssh_key.id]
  vpc_uuid = digitalocean_vpc.vpc.id
  user_data = file("userdata.sh") 
}