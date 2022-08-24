variable "domain" {
  type = string
  default = "epogodin.ru"
}

variable "image_id" {
  type = string
  default = "fd8mn5e1cksb3s1pcq12"
}

variable "core_fraction" {
  type = number
  default = 20
}

variable "preemptible" {
  type = bool
  default = true
}
