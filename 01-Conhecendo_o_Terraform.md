# Conhecendo o Terraform

<br>

## O que é o Terraform?

O **HashiCorp Terraform** é uma ferramenta de IaaS (Infraestrutura como Código) que permite que você construa, altere e versione uma infraestrutura de forma segura e eficiente.

<br>

## Como o Terraform trabalha

O **Terraform** cria e gerencia recursos em plataformas de nuvem e outros serviços por meio de suas APIs. 

<br>

O fluxo de trabalho principal do Terraform consiste em 03 estágios:

- **Write**: Você define recursos, que podem estar em vários provedores e serviços de nuvem. 

- **Plan**: O Terraform cria um plano de execução que descreve a infraestrutura que criará, atualizará ou destruirá com base na infraestrutura existente e na sua configuração.

- **Apply**: Após a aprovação, o Terraform realiza as operações propostas na ordem correta, respeitando eventuais dependências de recursos. 

<br>

![Fluxo de trabalho do Terraform](./Imagens/FluxoTerraform.avif)

<br>

## Infraestrutura Mutável e Infraestrutura Imutável

<br>

### Infraestrutura mutável

Permite que alterações sejam feitas na infraestrutura após a implantação, como atualização de software, configuração ou recursos. Isso pode ser flexível, mas também pode levar a erros e inconsistências porque é difícil acompanhar as alterações ao longo do tempo. 

<br>

### Infraestrutura imutável

Projetado para ser difícil ou impossível de alterar após a implantação. Em vez de modificar os recursos existentes, novos são criados para incorporar as mudanças. Isto pode ser mais confiável e seguro, mas também pode ser menos flexível.

<br>

## Saiba mais
[HashiCorp Terraform: What is Terraform?](https://developer.hashicorp.com/terraform/intro/)   
[HashiCorp: What is Mutable vs. Immutable Infrastructure?](https://www.hashicorp.com/resources/what-is-mutable-vs-immutable-infrastructure)   

