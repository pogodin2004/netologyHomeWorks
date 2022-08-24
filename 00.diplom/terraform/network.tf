resource "yandex_vpc_network" "pogodin-network" {
  name = "pogodin-network"
}

resource "yandex_vpc_route_table" "instance-route" {
  name = "instanxe_route"
  network_id = yandex_vpc_network.pogodin-network.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address = "192.168.1.100"
  }
}

resource "yandex_vpc_subnet" "pogodin-subnet1" {
  name           = "pogodin-subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.pogodin-network.id
  v4_cidr_blocks = ["192.168.1.0/24"]
  route_table_id = yandex_vpc_route_table.instance-route.id
}

resource "yandex_vpc_subnet" "pogodin-subnet2" {
  name           = "pogodin-subnet2"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.pogodin-network.id
  v4_cidr_blocks = ["192.168.2.0/24"]
  route_table_id = yandex_vpc_route_table.instance-route.id
}
