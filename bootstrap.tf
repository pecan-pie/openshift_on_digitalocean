resource "digitalocean_droplet" "bootstrap" {
  image  = "coreos-stable"
  name   = "bootstrap"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  // user_data = file("${path.module}/bootstrap.ign")
  tags     = ["bootstrap"]
  ssh_keys = [digitalocean_ssh_key.default.id]
}
