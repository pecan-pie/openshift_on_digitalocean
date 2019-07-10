resource "digitalocean_loadbalancer" "api" {
  name   = "api"
  region = "fra1"

  forwarding_rule {
    entry_port     = 6443
    entry_protocol = "tcp"

    target_port     = 6443
    target_protocol = "tcp"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_tag = "bootstrap"
  // droplet_ids = [digitalocean_droplet.boostrap.id, digitalocean_droplet.control-plane.*.id]
}

resource "digitalocean_loadbalancer" "api-int" {
  name   = "api-int"
  region = "fra1"

  forwarding_rule {
    entry_port     = 6443
    entry_protocol = "tcp"

    target_port     = 6443
    target_protocol = "tcp"
  }

  forwarding_rule {
    entry_port     = 22623
    entry_protocol = "tcp"

    target_port     = 22623
    target_protocol = "tcp"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_tag = "bootstrap"
  // droplet_ids = ["${digitalocean_droplet.boostrap.id}", "${digitalocean_droplet.control-plane.*.id}"]

  //droplet_ids = ["${digitalocean_droplet.web.id}"]
}

resource "digitalocean_loadbalancer" "apps" {
  name   = "apps"
  region = "fra1"

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "tcp"

    target_port     = 443
    target_protocol = "tcp"
  }

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "tcp"

    target_port     = 80
    target_protocol = "tcp"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_tag = "worker"

  //droplet_ids = ["${digitalocean_droplet.web.id}"]
}
