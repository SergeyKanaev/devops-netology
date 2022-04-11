Домашняя  работа к занятию "7.2. Облачные провайдеры и синтаксис Terraform."


Задача 1 (вариант с AWS). Регистрация в aws и знакомство с основами

Ответ: застопарилось на этапе привязки банковской карты.

Задача 1 (Вариант с Yandex.Cloud). Регистрация в ЯО и знакомство с основами (необязательно, но крайне желательно).

Ответ:

![image](https://user-images.githubusercontent.com/91260493/162813685-ed927a68-c45f-468b-9608-87e8484996b2.png)





Задача 2. Создание yandex_compute_instance через терраформ.

Если вы выполнили первый пункт, то добейтесь того, что бы команда terraform plan выполнялась без ошибок.

Ответ: 

          sergey@Vivo:~/terraform-switcher$ terraform plan

         Terraform used the selected providers to generate the following execution plan.
         Resource actions are indicated with the following symbols:
         + create

        Terraform will perform the following actions:

       # yandex_compute_image.foo-image will be created
       + resource "yandex_compute_image" "foo-image" {
       + created_at      = (known after apply)
       + folder_id       = (known after apply)
       + id              = (known after apply)
       + min_disk_size   = (known after apply)
       + name            = "my-test-image"
       + os_type         = (known after apply)
       + pooled          = (known after apply)
       + product_ids     = (known after apply)
       + size            = (known after apply)
       + source_disk     = (known after apply)
       + source_family   = (known after apply)
       + source_image    = (known after apply)
       + source_snapshot = (known after apply)
       + source_url      = (known after apply)
       + status          = (known after apply)
      }

      # yandex_compute_instance.vm[0] will be created
      + resource "yandex_compute_instance" "vm" {
      + created_at                = (known after apply)
      + description               = "instance from terraform"
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "test-01"
      + id                        = (known after apply)
      + name                      = "test1"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = (known after apply)
              + name        = (known after apply)
              + size        = 30
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

       + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = false
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = "e2l4v8oio31rr5ej1c4g"
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 4
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

        Plan: 2 to add, 0 to change, 0 to destroy.

    ───────────────────────────────────────────────────────────────────────────────
        Note: You didn't use the -out option to save this plan, so Terraform can't
        guarantee to take exactly these actions if you run "terraform apply" now.

       
       sergey@Vivo:~/terraform-switcher$ terraform apply

     Terraform used the selected providers to generate the following execution
     plan. Resource actions are indicated with the following symbols:
     + create

      Terraform will perform the following actions:

      # yandex_compute_instance.vm[0] will be created
      + resource "yandex_compute_instance" "vm" {
      + created_at                = (known after apply)
      + description               = "instance from terraform"
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "test-01"
      + id                        = (known after apply)
      + name                      = "test1"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-b"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd86tafe9jg6c4hd2aqp"
              + name        = (known after apply)
              + size        = 30
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = false
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = "e2l4v8oio31rr5ej1c4g"
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 4
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

     Plan: 1 to add, 0 to change, 0 to destroy.

      Do you want to perform these actions in workspace "stage"?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.

      Enter a value: yes

     yandex_compute_instance.vm[0]: Creating...
     yandex_compute_instance.vm[0]: Still creating... [10s elapsed]
     yandex_compute_instance.vm[0]: Still creating... [20s elapsed]
     yandex_compute_instance.vm[0]: Creation complete after 26s [id=epd2dpf533r5tvc26jri]
     Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

В качестве результата задания предоставьте ответ на вопрос:
      
1. при помощи какого инструмента (из разобранных на прошлом занятии) можно создать свой образ ami?

Ответ: Packer

2.Ссылку на репозиторий с исходной конфигурацией терраформа.

Ответ: https://github.com/SergeyKanaev/devops-netology/tree/main/Terraform

