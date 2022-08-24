resource "yandex_compute_instance" "nginx" {
  name = "nginx"
  hostname = "nginx.epogodin.ru"
  zone = "ru-central1-a"
  resources {
    core_fraction = var.core_fraction
    cores = 2
    memory = 2
  }
  scheduling_policy {
    preemptible = var.preemptible
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.pogodin-subnet1.id
    nat       = true
    ip_address = "192.168.1.100"
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "db01" {
  name = "db01"
  hostname = "db01.epogodin.ru"
  zone = "ru-central1-a"
  resources {
    core_fraction = var.core_fraction
    cores = 4
    memory = 4
  }
  scheduling_policy {
    preemptible = var.preemptible
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.pogodin-subnet1.id
    nat       = false
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "db02" {
  name = "db02"
  hostname = "db02.epogodin.ru"
  zone = "ru-central1-b"
  resources {
    core_fraction = var.core_fraction
    cores = 4
    memory = 4
  }
  scheduling_policy {
    preemptible = var.preemptible
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.pogodin-subnet2.id
    nat       = false
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "wordpress" {
  name = "app"
  hostname = "app.epogodin.ru"
  zone = "ru-central1-a"
  resources {
    core_fraction = var.core_fraction
    cores = 4
    memory = 4
  }
  scheduling_policy {
    preemptible = var.preemptible
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.pogodin-subnet1.id
    nat       = false
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "monitoring" {
  name = "monitoring"
  hostname = "monitoring.epogodin.ru"
  zone = "ru-central1-a"
  resources {
    core_fraction = var.core_fraction
    cores = 4
    memory = 4
  }
  scheduling_policy {
    preemptible = var.preemptible
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.pogodin-subnet1.id
    nat       = false
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "gitlab" {
  name = "gitlab"
  hostname = "gitlab.epogodin.ru"
  zone = "ru-central1-a"
  resources {
    core_fraction = var.core_fraction
    cores = 4
    memory = 4
  }
  scheduling_policy {
    preemptible = var.preemptible
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = "30"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.pogodin-subnet1.id
    nat       = false
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "runner" {
  name = "runner"
  hostname = "runner.epogodin.ru"
  zone = "ru-central1-a"
  resources {
    core_fraction = var.core_fraction
    cores = 4
    memory = 4
  }
  scheduling_policy {
    preemptible = var.preemptible
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.pogodin-subnet1.id
    nat       = false
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
