resource "digitalocean_droplet" "control-plane" {
  image  = "coreos-stable"
  count  = 3
  name   = "etcd-${count.index}"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  tags   = ["api"]

  user_data = file("${path.module}/config/master.ign")
  ssh_keys  = [digitalocean_ssh_key.default.id]
}
