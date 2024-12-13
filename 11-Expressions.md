# Expressions

<br>

As **expressions** referem-se ou calculam valores dentro de uma configuração. As **expressions** mais simples são apenas valores literais, como `"hello"` ou `5`, mas a linguagem Terraform também permite **expressions** mais complexas, como referências a dados exportados por recursos, aritmética, avaliação condicional e diversas funções integradas.

Você pode experimentar o comportamento das **expressions** do Terraform no console de **expressions** do Terraform, executando o comando `terraform console`.

<br>

## Tipos (Types) e Valores (Values)

O resultado de uma expressão é um valor. Todos os valores possuem um tipo, que determina onde esse valor pode ser usado e quais transformações podem ser aplicadas a ele.

<br>

### Tipos (Types)

A linguagem Terraform usa os seguintes tipos para seus valores:

- `string`: uma sequência de caracteres Unicode que representa algum texto, como `"hello"`.

- `number`: um valor numérico. O tipo de número pode representar números inteiros como `15` e valores fracionários como `6,283185`.

- `bool`: um valor booleano, `true` ou `false`. Valores `bool` podem ser usados ​​em lógica condicional.

- `list` (ou `tuple`): uma sequência de valores, como `["us-west-1a", "us-west-1c"]`. Identifique os elementos de uma lista com números inteiros consecutivos, começando com zero.

- `set`: uma coleção de valores exclusivos que não possuem identificadores secundários ou ordenação.

- `map` (ou `object`): um grupo de valores identificados por labels nomeados, como `{nome = "Mabel", idade = 52}`.

- `null`: um valor que representa ausência ou omissão. Se você definir um argumento de um recurso como `null`, o Terraform se comportará como se você o tivesse omitido completamente. Ele usará o valor padrão do argumento, se houver, ou gerará um erro se o argumento for obrigatório. `null` é mais útil em expressões condicionais, portanto você pode omitir dinamicamente um argumento se uma condição não for atendida.

`string`, `number` e `bool` às vezes são chamados de *tipos primitivos*. 

`list`/`tuple` e `map`/`objects` são às vezes chamados de *tipos complexos*, *tipos estruturais* ou *tipos de coleção*.

<br>

## Saiba mais
[HashiCorp Terraform: Expressions](https://developer.hashicorp.com/terraform/language/expressions)   
[HashiCorp Terraform: Types and Values](https://developer.hashicorp.com/terraform/language/expressions/types)   