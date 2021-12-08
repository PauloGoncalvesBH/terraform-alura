
# Aula 02.02 - Criando security group
resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Acesso ao SSH"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["201.17.172.46/32"] # IPv4 e /32
  }

  tags = {
    Name = "ssh"
  }
}
