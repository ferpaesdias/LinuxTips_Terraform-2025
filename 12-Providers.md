# Providers

O Terraform depende de plug-ins chamados **providers** para interagir com provedores de nuvem, provedores de SaaS e outras APIs.

As configurações do Terraform devem declarar quais providers são necessários para que o Terraform possa instalá-los e usá-los. Além disso, alguns providers exigem configuração (como URLs de endpoint ou regiões de nuvem) antes de poderem ser usados.

Cada provedor adiciona um conjunto de tipos de recursos (resources types) e/ou fontes de dados (data sources) que o Terraform pode gerenciar.

Cada tipo de recurso é implementado por um provedor; sem providers, o Terraform não consegue gerenciar nenhum tipo de infraestrutura.

Os providers são distribuídos separadamente do próprio Terraform e cada provider tem sua própria cadência de lançamento e números de versão.

O **Terraform Registry** é o diretório principal de providers Terraform disponíveis publicamente e hospeda providers para a maioria das principais plataformas de infraestrutura.

<br>

## Como Encontrar Providers

Para encontrar providers para as plataformas de infraestrutura que você usa, navegue na seção de providers do **Terraform Registry**.

Alguns providers no Registry são desenvolvidos e publicados pela HashiCorp, alguns são publicados pelos mantenedores da plataforma e alguns são publicados por usuários e voluntários.

As listagens de providers usam os seguintes emblemas para indicar quem desenvolve e mantém um determinado fornecedor.

| Tier | Descrição | Namespace |
| :-: | :-: | :-: |
| Official | Os providers oficiais que pertencem e são mantidos pela HashiCorp | hashicorp |
| Partner | Os providers parceiros são escritos, mantidos, validados e publicados por empresas terceirizadas em suas próprias APIs. Para ganhar um selo de fornecedor parceiro, o parceiro deve participar do HashiCorp Technology Partner Program. | Organização terceirizada, por ex. mongodb/mongodbatlas |
| Community | Os providers da comunidade são publicados no Terraform Registry por mantenedores individuais, grupos de mantenedores ou outros membros da comunidade Terraform. | Conta individual ou organizacional do mantenedor, por ex. DeviaVir/gsuite |
| Archived | Providers Archived são Providers Oficiais ou Parceiros que não são mais mantidos pela HashiCorp ou pela comunidade. Isso pode ocorrer se uma API estiver obsoleta ou se o interesse for baixo. | hashicorp ou third-party |

<br>

## Configuração do Provider

As configurações do provider pertencem ao módulo raiz (root) de uma configuração do Terraform. Os módulos filhos recebem suas configurações de provider do módulo raiz.

Uma configuração de provider é criada usando um bloco de provider:

```
provider "google" {
  project = "acme-app"
  region  = "us-central1"
}
```

<br>

Existem também dois "meta-argumentos" que são definidos pelo próprio Terraform e estão disponíveis para todos os blocos de providers:

- `alias`, para usar o mesmo provedor com configurações diferentes para recursos diferentes

- `version`, que não recomendamos mais (use os requisitos do provedor)

Ao contrário de muitos outros objetos na linguagem Terraform, um bloco `provider` pode ser omitido se seu conteúdo estiver vazio. O Terraform assume uma configuração padrão vazia para qualquer provedor que não esteja configurado explicitamente.

<br>

### alias - Múltiplos Providers

Para criar diversas configurações para um determinado provedor, inclua vários blocos `provider` com o mesmo nome de provedor. Para cada configuração adicional não padrão, use o meta-argumento `alias` para fornecer um segmento de nome extra. Por exemplo:

```
# A configuração padrão do provider;
# recursos que começam com `aws_` o usarão e pode ser referenciado como `aws`.
provider "aws" {
  region = "us-east-1"
}

# Configuração adicional de provedor para região costa oeste; 
# recursos podem referenciar isso com `aws.west`.
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}
```

<br>

Para declarar um alias de configuração dentro de um módulo para receber uma configuração de provedor alternativa do módulo pai, adicione o argumento `configuration_aliases` à entrada `require_providers` desse provedor. O exemplo a seguir declara os nomes de configuração do provedor `mycloud` e `mycloud.alternate` no módulo que os contém:

```
terraform {
  required_providers {
    mycloud = {
      source  = "mycorp/mycloud"
      version = "~> 1.0"
      configuration_aliases = [ mycloud.alternate ]
    }
  }
}
```

<br>

## Saiba mais
[HashiCorp Terraform: Providers](https://developer.hashicorp.com/terraform/language/providers)   