provider "yandex" {
  token     = "Top Secret"
  cloud_id  = "b1g46qfi6e076n22dr62"
  folder_id = "b1gfkp0mo5s4h3tgngbu"
  zone      = "ru-central1-b"
}

data "yandex_compute_image" "image" {
  family = "centos-8"
}




resource "yandex_compute_instance" "vm" {
  count       = 1
  name        = "test1"
  platform_id = "standard-v1"
  hostname = "${"test"}-${format("%02d", 0+count.index+1)}"
  description = "instance from terraform"
  zone        = "ru-central1-b"
  
  network_interface {
  subnet_id   = "e2l4v8oio31rr5ej1c4g"
    nat       = "false"
  }


  
  resources {
    cores  = 2
    memory = 4
  }
  # ...

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.image.id
      type = "network-hdd"
      size = "30"
    }
  }
}

