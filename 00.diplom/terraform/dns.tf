resource "yandex_dns_zone" "netology-zone" {
  name = "epogodin-public-zone"
  zone    = "${var.domain}."
  public  = true
}

resource "yandex_dns_recordset" "record_1" {
  zone_id = yandex_dns_zone.netology-zone.id
  name    = "@"
  type    = "A"
  ttl     = 60
  data    = ["${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}"]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "record_2" {
  zone_id = yandex_dns_zone.netology-zone.id
  name    = "www"
  type    = "A"
  ttl     = 60
  data    = ["${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}"]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "record_3" {
  zone_id = yandex_dns_zone.netology-zone.id
  name    = "gitlab"
  type    = "A"
  ttl     = 60
  data    = ["${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}"]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "record_4" {
  zone_id = yandex_dns_zone.netology-zone.id
  name    = "grafana"
  type    = "A"
  ttl     = 60
  data    = ["${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}"]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "record_5" {
  zone_id = yandex_dns_zone.netology-zone.id
  name    = "prometheus"
  type    = "A"
  ttl     = 60
  data    = ["${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}"]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "record_6" {
  zone_id = yandex_dns_zone.netology-zone.id
  name    = "alertmanager"
  type    = "A"
  ttl     = 60
  data    = ["${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}"]
  depends_on = [yandex_compute_instance.nginx]
}
