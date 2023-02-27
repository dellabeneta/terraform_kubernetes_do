resource "digitalocean_ssh_key" "ssh_key" {
  name       = "kubernetes"
  public_key = file("/home/della/.ssh/id_rsa.pub")
}
