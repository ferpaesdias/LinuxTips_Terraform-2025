# HCL

O **HCL** (HashiCorp Configuration Language) é uma sintaxe de configuração estruturada que serve de base para a linguagem de configuração do Terraform, bem como a camada de configuração para vários produtos HashiCorp.

A **HCL** estabelece a sintaxe que o Terraform usa para itens como *argumentos*, *blocos*, *valores literais* e *expressões*. Mas o que a maioria das pessoas considera Terraform Language vai além da sintaxe; as funções integradas, tipos de blocos específicos do Terraform (como recurso e variável) e valores nomeados específicos do Terraform disponíveis em expressões são todos detalhes de implementação do próprio Terraform.

<br>

## Sobre o Terraform Language

O principal objetivo da Terraform Language é declarar recursos, que representam objetos de infraestrutura. Todos os outros recursos da linguagem existem apenas para tornar a definição de recursos mais flexível e conveniente.

Uma configuração do Terraform é um documento completo na Terraform Language que informa ao Terraform como gerenciar uma determinada coleção de infraestrutura. Uma configuração pode consistir em vários arquivos e diretórios.

A Terraform Language é declarativa, descrevendo um objetivo pretendido em vez das etapas para alcançá-lo

A ordem dos blocos e os arquivos em que estão organizados geralmente não são significativos; O Terraform considera apenas relacionamentos implícitos e explícitos entre recursos ao determinar uma ordem de operações.

<br>

A sintaxe da Terraform Language consiste apenas em alguns elementos básicos:

```
resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}

<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
  # Block body
  <IDENTIFIER> = <EXPRESSION> # Argument
}
```

<br>

- **Blocos** (Blocks): Os blocos são containers para outros conteúdos e geralmente representam a configuração de algum tipo de objeto, como um recurso. Os blocos possuem um tipo de bloco, podem ter zero ou mais rótulos e possuem um corpo que contém qualquer número de argumentos e blocos aninhados. A maioria dos recursos do Terraform são controlados por blocos de nível superior em um arquivo de configuração.

- **Argumentos** (Arguments): Os argumentos atribuem um valor a um nome. Eles aparecem dentro de blocos.

- **Expressões** (Expressions): As expressões representam um valor, literalmente ou por referência e combinação de outros valores. Eles aparecem como valores para argumentos ou dentro de outras expressões.

<br>

## Saiba mais
[HashiCorp Terraform: HCL](https://developer.hashicorp.com/terraform/docs/glossary#hcl)   
[HashiCorp: Terraform Language Documentation](https://developer.hashicorp.com/terraform/language)   
