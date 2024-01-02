provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
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
    
