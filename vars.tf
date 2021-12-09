
variable "amis" {
  type = map

  default = {
    "us-east-1" = "ami-083654bd07b5da81d"
    "us-east-2" = "ami-0629230e074c580f2"
  }
}
