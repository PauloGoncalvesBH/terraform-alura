# Configure the AWS Provider
provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
}

# Create a VPC
# resource "aws_vpc" "example" {
#   cidr_block = "10.0.0.0/16"
# }

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-083654bd07b5da81d" # Ubuntu Server 20.04 LTS (HVM), SSD Volume Type (64 bits x86)
  instance_type = "t2.micro" # Tamanho para free tier
  key_name = "terraform-curso-alura" # Nome do par de chaves criada na AWS. Ler README aula 01.04.
  tags = {
    Name = "dev${count.index}"
  }
}

# Aula 02.02 - Criando security group
resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Acesso ao SSH"
  # vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["201.17.172.46/32"] # IPv4 e /32
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  # egress {
  #   from_port        = 0
  #   to_port          = 0
  #   protocol         = "-1"
  #   cidr_blocks      = ["0.0.0.0/0"]
  #   ipv6_cidr_blocks = ["::/0"]
  # }

  tags = {
    Name = "ssh"
  }
}
