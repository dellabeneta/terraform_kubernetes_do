# Create a new SSH key
resource "digitalocean_ssh_key" "ssh_key" {
  name       = "kubernetes"
  public_key = file("~/.ssh/id_rsa.pub")
}
