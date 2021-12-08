
# Curso de terraform da Alura

## Referências

- [Documentação do provider AWS no Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Curso de Terraform: Automatize a infraestrutura na nuvem](https://cursos.alura.com.br/course/terraform)
- [Página da AWS dos buckets S3](https://s3.console.aws.amazon.com/s3/home?region=us-east-1)
- [Página da AWS das instâncias EC2 em us-east-1](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Instances:v=3;sort=tag:Name)

## Aula 01.04

Usar o seguinte comando para gerar SSH:
```
ssh-keygen -t rsa -f terraform-alura-aws
```
Gera no projeto a chave pública (terraform-alura-aws.pub) e privada (terraform-alura-aws).

É preciso mover a chave privada para o diretório de shh.
```
mv terraform-alura-aws ~/.ssh
```

Por questão de organização é preciso copiar a chave pública também.
```
cp terraform-alura-aws.pub ~/.ssh
```

É preciso **Importar o par de chaves** em https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#KeyPairs: e criar a chave.

## Comandos

### Aula 01.06

Usar o seguinte comando para baixar as dependências e plugins:

```
terraform init
```

Execute o seguinte comando para saber como vai ficar o ambiente:
```
terraform plan
```

Caso o planejamento acima esteja correto, é preciso aplicar, fazendo o deploy, com o comando:
```
terraform apply
```

### Aula 02.04

Comando para ter uma _foto_ de como está o ambiente (Ele lê o arquivo _terraform.tfstate_, que não deve ser versionado):
```
terraform show
```

Para ver os security groups via AWS CLI:
```
aws ec2 describe-security-groups
```

## Para conectar na instância via SSH

Ir na lista de instâncias, selecionar a instância, clicar em **Conectar** via **Cliente SSH** e copiar o comando.

Exemplo:
```
ssh -i "terraform-curso-alura.pem" ubuntu@ec2-54-86-4-122.compute-1.amazonaws.com
```

Substituir o `terraform-curso-alura.pem` pela chave privada do SSH, que está em `~/.ssh/terraform-alura-aws`:
```
ssh -i ~/.ssh/terraform-alura-aws ubuntu@ec2-54-86-4-122.compute-1.amazonaws.com 
```

## Quebrando o arquivo main.tf em pequenos arquivos (Aula 04.02)

Sugestão é organizar os arquivos quebrando por recursos. No dia a dia o instrutor gosta de, o que chama de _recursos principais_ (instâncias, bucket, database, que são recursos de infra), coloca no `main.tf`, recursos separados, como _security groups, variáveis_, etc, separa em arquivos únicos.
