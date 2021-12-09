
# Aula 02.02 - Criando security group
resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Acesso ao SSH"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto # IPv4 e /32
  }

  tags = {
    Name = "ssh"
  }
}

# Aula 04.04 - Lidando com multi-region
resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider = aws.us-east-2 # Provider ponto nome do alias
  name        = "acesso-ssh"
  description = "Acesso ao SSH"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto # IPv4 e /32
  }

  tags = {
    Name = "ssh"
  }
}
