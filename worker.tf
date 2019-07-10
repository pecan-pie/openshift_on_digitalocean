resource "digitalocean_droplet" "worker" {
  image  = "coreos-stable"
  count  = 2
  name   = "worker-${count.index}"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  tags   = ["worker"]

  user_data = file("${path.module}/config/worker.ign")
  ssh_keys  = [digitalocean_ssh_key.default.id]
}
