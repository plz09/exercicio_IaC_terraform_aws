# Projeto IaC com Terraform e AWS

## Descrição do Projeto
Este projeto foi desenvolvido como parte de um curso prático para automação de infraestrutura na AWS usando Terraform. O objetivo é criar um servidor web na AWS, seguindo os requisitos específicos estabelecidos no exercício.

## Requisitos do Exercício
Durante o Lab 3, foram criados 4 servidores web na AWS via automação com IaC. Para este exercício adicional, foram solicitados os seguintes requisitos:

1. O servidor web deve ter 3 réplicas (ou seja, de fato serão 3 instâncias EC2 criadas em um único projeto Terraform). Use a camada gratuita com o tipo de instância t2.micro.
2. Cada servidor web deve ter uma página HTML diferente identificando o servidor.
3. Um loop no arquivo `main.tf` deve criar as 3 instâncias EC2 de forma automatizada, com a menor quantidade de código possível.
4. Além do loop, um condicional deve verificar a AMI e só criar a instância se a AMI for a Amazon Machine Image com o mesmo código que usamos durante o Lab3.

## Implementação no Projeto
- **Instâncias EC2:** Utilizei um loop no arquivo `main.tf` para criar as 3 instâncias EC2 de forma automatizada.
- **Personalização das Páginas HTML:** Cada servidor web possui uma página HTML única, identificando o servidor. Os scripts para personalização estão em `dsa_script.sh`.
- **Condicional para AMI:** Adicionei um condicional para verificar a AMI antes de criar as instâncias, garantindo consistência com a AMI utilizada no Lab3.

## Requisitos Adicionais
- Terraform instalado
- Chave privada para acesso SSH à instância EC2

