terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.87.0"
    }
  }


  # Описание бэкенда хранения состояния
  backend "s3" {
    endpoints = { 
    s3 = "https://storage.yandexcloud.net/"
    }
    bucket     = "terraform-state-std-024-12"
    region     = "ru-central1"
    key        = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # необходимая опция при описании бэкенда для Terraform 

  }
}
provider "yandex" {
  cloud_id  = "b1g3jddf4nv5e9okle7p"
  folder_id = "b1gk067d0krcal09flv4"
  zone      = "ru-central1-a"
}

    variable "network_zone" {
      description = "Yandex.Cloud network availability zones"
      type        = string
      default     = "ru-central1-a"
    }

    data "yandex_vpc_network" "default" {
      name = "default"
    }

    data "yandex_vpc_subnet" "default" {
      name = "${data.yandex_vpc_network.default.name}-${var.network_zone}" 
    } 

    output "yandex_vpc_subnets" {
      description = "Yandex.Cloud Subnets map"
      value       = data.yandex_vpc_subnet.default
    } 
    

resource "yandex_compute_instance" "vm-1" {
    name = "chapter5-lesson2-std-024-12"
    
    # Конфигурация ресурсов:
    # количество процессоров и оперативной памяти
    resources {
        cores  = 2
        memory = 2
    }

    # Загрузочный диск:
    # здесь указывается образ операционной системы
    # для новой виртуальной машины
    boot_disk {
        initialize_params {
            image_id = "fd80qm01ah03dkqb14lc"
        }
    }

    # Сетевой интерфейс:
    # нужно указать идентификатор подсети, к которой будет подключена ВМ
    network_interface {
        subnet_id = "e9bsf4ne4ccohj8gptvp"
        nat       = true
    }

    # Метаданные машины:
    # здесь можно указать скрипт, который запустится при создании ВМ
    # или список SSH-ключей для доступа на ВМ
    metadata = {
        user-data = "${file("/home/mrandrew/infrastructure/infrastructure/terraform/scripts/cloud-init.yaml")}"
    }
}

output "ip_address" {
    value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "nat_ip_address" {

    value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address

}
