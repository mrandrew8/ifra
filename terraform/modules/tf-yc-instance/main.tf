#Создание инстанса с именем chapter5-lesson2-std-024-12
resource "yandex_compute_instance" "vm-1" {
    name = "chapter5-lesson2-std-024-12"
    zone = var.zone
    platform_id = var.platform_id
    
    
    # Конфигурация ресурсов:
    # количество процессоров и оперативной памяти
    resources {
        cores  = var.cores
        memory = var.memory
    }

    # Загрузочный диск:
    # здесь указывается образ операционной системы
    # для новой виртуальной машины
    boot_disk {
        initialize_params {
            image_id = var.image_id
            size = var.size
        }
    }

    # Сетевой интерфейс:
    # нужно указать идентификатор подсети, к которой будет подключена ВМ
    network_interface {
        subnet_id = var.subnet_id
        nat       = var.nat
    }

    # Метаданные машины:
    # здесь можно указать скрипт, который запустится при создании ВМ
    # или список SSH-ключей для доступа на ВМ
    metadata = {
        user-data = "${file("/home/mrandrew/infrastructure/infrastructure/terraform/scripts/cloud-init.yaml")}"
    }
    scheduling_policy {
    	preemptible = var.preemptible
  }
    
}
