
# Curso de terraform da Alura

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

## Aula 01.06

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
