# HCL - Syntax

<br>

Essa sintaxe de baixo nível da linguagem Terraform é definida em termos de uma sintaxe chamada HCL, que também é usada por linguagens de configuração em outras aplicações e, em particular, em outros produtos HashiCorp. Não é necessário conhecer todos os detalhes da sintaxe HCL para usar o Terraform e, portanto, esta página resume os detalhes mais importantes. 

<br>

## Argumentos (Arguments)

Um argumento atribui um valor a um nome específico:

```
image_id = "abc123"
```
- `image_id`: Nome do argumento
- `"abc123"`: Valor do argumento

<br>

O contexto onde o argumento aparece determina quais tipos de valor são válidos (por exemplo, cada tipo de recurso possui um esquema que define os tipos de seus argumentos), mas muitos argumentos aceitam expressões arbitrárias, que permitem que o valor seja especificado literalmente ou gerado a partir de outros valores programaticamente.

<br>

## Blocos (Blocks)

<br>

Um bloco é um contêiner para outro conteúdo:

```
resource "aws_instance" "example" {
  ami = "abc123"

  network_interface {
    # ...
  }
}
```

<br>

Um bloco possui um tipo (`resource`, neste exemplo). Cada tipo de bloco define quantos labels devem ter.

O `resource` do tipo bloco espera dois labels que, no exemplo acima, são `aws_instance` e `example`.

O label `aws_instance` é específico do provedor AWS. Ele especifica o tipo de recurso que o Terraform provisiona quando você aplica a configuração.

O segundo label é um nome arbitrário que você pode adicionar à instância específica do recurso. Você pode criar várias instâncias do mesmo tipo de bloco e diferenciá-las dando a cada instância um nome exclusivo.

Neste exemplo, o autor da configuração do Terraform atribuiu o label `example` a esta instância do recurso `aws_instance`. Um tipo de bloco específico pode ter qualquer número de labels necessários ou pode não exigir nenhum, como acontece com o tipo de bloco `network_interface`.

Após a palavra-chave do tipo de bloco e quaisquer labels, o corpo do bloco é delimitado pelos caracteres `{` e `}`. Dentro do corpo do bloco, outros argumentos e blocos podem ser aninhados, criando uma hierarquia de blocos e seus argumentos associados.

A linguagem Terraform usa um número limitado de tipos de blocos de nível superior, que são blocos que podem aparecer fora de qualquer outro bloco em um arquivo de configuração. A maioria das features do Terraform (incluindo recursos, variáveis ​​de entrada, valores de saída, fontes de dados, etc.) são implementados como blocos de nível superior.

<br>

## Identificadores (Identifiers)

Nomes de argumentos, nomes de tipos de blocos e os nomes da maioria dos constructs específicos do Terraform, como recursos, variáveis ​​de entrada, etc., são todos identificadores.

Os identificadores podem conter letras, dígitos, sublinhados (`_`) e hifens (`-`). O primeiro caractere de um identificador não deve ser um dígito, para evitar ambiguidade com números literais.

Para regras de identificador completas, o Terraform implementa a [sintaxe do identificador Unicode](http://unicode.org/reports/tr31/), estendida para incluir o caractere hífen ASCII `-`.

<br>

## Comentários (Comments)

A linguagem Terraform oferece suporte a três sintaxes diferentes para comentários:

- `#`: Inicia um comentário de linha única, terminando no final da linha.

- `//`: Inicia um comentário de linha única, como alternativa a `#`.

- `/*` e `*/`: São delimitadores de início e fim para um comentário que pode abranger várias linhas.

O estilo de comentário de linha única `#` é o estilo de comentário padrão e deve ser usado na maioria dos casos. As ferramentas de formatação de configuração automática podem transformar automaticamente `//` comentários em `#` comentários, uma vez que o estilo de barra dupla não é idiomático.

<br>

## Codificação de caracteres e finais de linha

Os arquivos de configuração do Terraform devem sempre ser codificados em UTF-8. Embora os delimitadores do idioma sejam todos caracteres ASCII, o Terraform aceita caracteres não ASCII em identificadores, comentários e valores de string.

O Terraform aceita arquivos de configuração com terminações de linha no estilo Unix (somente LF) ou terminações de linha no estilo Windows (CR e LF), mas o estilo idiomático é usar a convenção Unix e, portanto, as ferramentas de formatação automática de configuração podem transformar automaticamente as terminações CRLF em SE.

<br>

## Saiba mais
[HashiCorp Configuration Syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration)   