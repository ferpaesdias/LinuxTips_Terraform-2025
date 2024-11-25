# Conhecendo o Terraform

<br>

## O que é o Terraform?

O **HashiCorp Terraform** é uma ferramenta de IaaS (Infraestrutura como Código) que permite que você construa, altere e versione uma infraestrutura de forma segura e eficiente.

<br>

## Como o Terraform trabalha

O **Terraform** cria e gerencia recursos em plataformas de nuvem e outros serviços por meio de suas APIs. 

<br>

O fluxo de trabalho principal do Terraform consiste em 03 estágios:

- **write**: Você define recursos, que podem estar em vários provedores e serviços de nuvem. 

- **Plan**: O Terraform cria um plano de execução que descreve a infraestrutura que criará, atualizará ou destruirá com base na infraestrutura existente e na sua configuração.

- **Apply**: Após a aprovação, o Terraform realiza as operações propostas na ordem correta, respeitando eventuais dependências de recursos. 

<br>

## Infraestrutura imutável

A **infraestrutura imutável** é a infraestrutura que, uma vez implantada, nunca será modificada, somente substituída.