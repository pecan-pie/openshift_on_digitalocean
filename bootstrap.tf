resource "digitalocean_droplet" "bootstrap" {
  image     = "coreos-beta"
  name      = "bootstrap"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  user_data = <<EOF
{
  "ignition": {
    "version": "2.2.0",
    "config": {
      "replace": {
        "source": "http://${digitalocean_droplet.bootstrap-helper.ipv4_address}:80/bootstrap.ign"
      }
    }
  }
}
  EOF
  tags = ["api"]
  ssh_keys = [digitalocean_ssh_key.default.id]
}
# "source": "http://${digitalocean_droplet.bootstrap-helper.ipv4_address}:80/bootstrap.ign"
resource "digitalocean_droplet" "bootstrap-helper" {
  image = "ubuntu-18-04-x64"
  name = "bootstrap-helper"
  region = "fra1"
  size = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.default.id]


  provisioner "remote-exec" {
    inline = [
      "apt-get -y install apache2",
    ]

    connection {
      type = "ssh"
      user = "root"
      host = "${digitalocean_droplet.bootstrap-helper.ipv4_address}"
      private_key = file("~/.ssh/id_rsa")
    }
  }

  provisioner "file" {
    source = "${path.module}/config/bootstrap.ign"
    destination = "/var/www/html/bootstrap.ign"

    connection {
      type = "ssh"
      user = "root"
      host = "${digitalocean_droplet.bootstrap-helper.ipv4_address}"
      private_key = file("~/.ssh/id_rsa")
    }
  }
}


