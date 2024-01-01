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
    
