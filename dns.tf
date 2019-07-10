resource "digitalocean_domain" "clusterdomain" {
  name = "${var.domain}"
}

resource "digitalocean_record" "apps" {
  domain = "${digitalocean_domain.clusterdomain.name}"
  type   = "A"
  name   = "*.apps"
  value  = "${digitalocean_loadbalancer.apps.ip}"
}

resource "digitalocean_record" "api" {
  domain = "${digitalocean_domain.clusterdomain.name}"
  type   = "A"
  name   = "api"
  value  = "${digitalocean_loadbalancer.api.ip}"
}

resource "digitalocean_record" "api-int" {
  domain = "${digitalocean_domain.clusterdomain.name}"
  type   = "A"
  name   = "api-int"
  value  = "${digitalocean_loadbalancer.api-int.ip}"
}

resource "digitalocean_record" "etdsrv0" {
  domain   = "${digitalocean_domain.clusterdomain.name}"
  type     = "SRV"
  name     = "_etcd-server-ssl._tcp"
  weight   = 10
  port     = 2380
  ttl      = 86400
  priority = 0
  value    = "etcd-0"
}

resource "digitalocean_record" "etdsrv1" {
  domain   = "${digitalocean_domain.clusterdomain.name}"
  type     = "SRV"
  name     = "_etcd-server-ssl._tcp"
  weight   = 10
  port     = 2380
  ttl      = 86400
  priority = 0
  value    = "etcd-1"
}

resource "digitalocean_record" "etdsrv2" {
  domain   = "${digitalocean_domain.clusterdomain.name}"
  type     = "SRV"
  name     = "_etcd-server-ssl._tcp"
  weight   = 10
  port     = 2380
  ttl      = 86400
  priority = 0
  value    = "etcd-2"
}
