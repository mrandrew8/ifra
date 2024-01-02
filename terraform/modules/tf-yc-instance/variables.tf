variable zone {
  description = "зона доступности, в которой по умолчанию будут создаваться все облачные ресурсы"
  default     = "ru-central1-a"
}

variable cores {
  description = "кол-во ядер для создаваемой виртуалки"
  default     = 2
}

variable memory {
  description = "оперативка для создаваемой виртуалки"
  default     = 2
}

variable image_id {
  description = "образ ОС для виртуалки"
  default     = "fd80qm01ah03dkqb14lc"
}

variable subnet_id {
  description = "идентификатор подсети, к которой будет подключена ВМ"
  default     = "e9bsf4ne4ccohj8gptvp"
}

variable nat {
  description = "публичный айпишник для виртуалки"
  default     = true
}

variable preemptible {
  description = "политика планирования. Чтобы создать прерываемую ВМ, укажите preemptible = true"
  default     = true
}
