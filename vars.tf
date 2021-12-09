
variable "amis" {
  type = map

  default = {
    "us-east-1" = "ami-083654bd07b5da81d"
    "us-east-2" = "ami-0629230e074c580f2"
  }
}

variable "cdirs_acesso_remoto" {
  type = list

  default = ["201.17.172.46/32"]
}

variable "key_name" {
  default = "terraform-curso-alura"
}
