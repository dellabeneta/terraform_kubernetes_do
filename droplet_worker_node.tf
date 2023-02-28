resource "digitalocean_droplet" "worker_node" {
  count    = 2
  image    = "ubuntu-22-04-x64"
  name     = "worker-node-${count.index}"
  region   = var.region
  size     = var.droplet_size
  ssh_keys = [digitalocean_ssh_key.ssh_key.id]
  vpc_uuid = digitalocean_vpc.vpc.id
  //user_data = file("install_all.sh") 
}