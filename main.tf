
provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
}

# Aula 04.04 - Lidando com multi-region
provider "aws" {
  alias = "us-east-2"
  version = "~> 3.0"
  region  = "us-east-2"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-083654bd07b5da81d" # Ubuntu Server 20.04 LTS (HVM), SSD Volume Type (64 bits x86)
  instance_type = "t2.micro" # Tamanho para free tier
  key_name = "terraform-curso-alura" # Nome do par de chaves criada na AWS. Ler README aula 01.04.
  tags = {
    Name = "dev${count.index}"
  }
  # vpc_security_group_ids = ["sg-0628852506181d566"] ID do security group, primeira forma feita porém com limitação
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"] # Pegando ID do security group criado
}

# Aula 03.02 - Vinculando nova máquina dev4 com bucket S3
resource "aws_instance" "dev4" {
  ami = "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
  key_name = "terraform-curso-alura"
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_s3_bucket.dev4] # É aqui que vincula a dev4 com o bucket s3 criado
}

# Aula 03.02 - O instrutor está crazy, para que a dev5 people?
resource "aws_instance" "dev5" {
  ami = "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
  key_name = "terraform-curso-alura"
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

# Aula 04.04 - Lidando com multi-region
resource "aws_instance" "dev6" {
  provider = aws.us-east-2 # Provider da region us-east-2
  ami = "ami-0629230e074c580f2" # O AMI é diferente das outras máquinas pois cada region possui um ami diferente por tipo de instância
  instance_type = "t2.micro"
  key_name = "terraform-curso-alura"
  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"] # security group criado para a region us-east-2
  depends_on = [aws_dynamodb_table.dynamodb-homologacao]
}

# Aula 03.02 - Vinculando nova máquina dev4 com bucket S3
# Bucket da AWS não precisa de region, pois já é multi-region
resource "aws_s3_bucket" "dev4" {
  bucket = "rmerceslabs-dev4-paulo-08-12-2021" # Sei lá porque rmerceslabs, deve ser propaganda do instrutor
  acl    = "private"

  tags = {
    Name = "rmerceslabs-dev4"
  }
}

# Aula 04.06
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table
resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider       = aws.us-east-2
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}
