resource "digitalocean_ssh_key" "ssh_key" {
  name       = "kubernetes"
  public_key = file("?")
}
