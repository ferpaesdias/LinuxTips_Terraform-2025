# Backend

<br>

O backend define onde o Terraform armazena seus arquivos de dados de estado (state data files).

O Terraform usa dados de estado persistentes para controlar os recursos que gerencia. Você pode integrar-se ao *HCP Terraform* para armazenar dados de estado ou definir um bloco `backend` para armazenar o estado em um objeto remoto. Isso permite que várias pessoas acessem os dados do estado e trabalhem juntas nessa coleção de recursos de infraestrutura.

<br>

## Backend padrão

O Terraform usa um backend chamado `local` por padrão. O tipo de backend `local` armazena o estado como um arquivo local no disco.

<br>

## Tipos de backend

O Terraform vem com vários tipos de backend integrados. Alguns backends funcionam como discos remotos para arquivos de estado, enquanto outros oferecem suporte ao bloqueio do estado durante as operações do Terraform para evitar conflitos e inconsistências. Você não pode carregar backends adicionais como plug-ins.

Especifique o tipo de backend como label `backend` no bloco. O exemplo a seguir instrui o Terraform a usar um backend remoto:

```
backend "remote" {
  organization = "example_corp"
  . . . 
}
```

<br>

## Inicialize o backend

Ao alterar a configuração de um backend, você deve executar o `terraform init` novamente para validar e configurar o backend antes de poder executar qualquer operação de planejamento, aplicação ou estado.

Após a inicialização, o Terraform cria um diretório `.terraform/` localmente. Este diretório contém a configuração de backend mais recente, incluindo quaisquer parâmetros de autenticação fornecidos à CLI do Terraform. Não faça check deste diretório no Git, pois ele pode conter credenciais confidenciais para seu backend remoto.

A configuração de backend local é diferente e totalmente separada do arquivo `terraform.tfstate` que contém dados de estado sobre sua infraestrutura do mundo real. O Terraform armazena o arquivo `terraform.tfstate` em seu backend remoto.

Quando você altera os backends, o Terraform oferece a opção de migrar seu estado para o novo backend. Isso permite adotar backends sem perder nenhum estado existente.

>[!Important]
Antes de migrar para um novo backend, recomendamos fazer backup manualmente do seu estado, copiando o arquivo `terraform.tfstate` para outro local.

<br>

## Saiba mais
[HashiCorp Terraform: Backend block configuration overview](https://developer.hashicorp.com/terraform/language/backend)   