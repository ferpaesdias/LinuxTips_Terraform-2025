# Variables e Outputs

<br>

A linguagem Terraform inclui alguns tipos de blocos para solicitar ou publicar valores nomeados.

- As **Input Variables** servem como parâmetros para um módulo Terraform, para que os usuários possam personalizar o comportamento sem editar a fonte.

- As **Output Values** são como valores de retorno para um módulo Terraform.

- As **Local Values** são um recurso conveniente para atribuir um nome abreviado a uma expressão.

<br>

## Input Variables

As **Input Variables** permitem personalizar aspectos dos módulos do Terraform sem alterar o código-fonte do próprio módulo. Essa funcionalidade permite compartilhar módulos em diferentes configurações do Terraform, tornando seu módulo combinável e reutilizável.

Ao declarar variáveis ​​no módulo raiz de sua configuração, você pode definir seus valores usando opções CLI e variáveis ​​de ambiente. Quando você os declara em módulos filhos, o módulo chamador deve passar valores no bloco `module`.

Se você estiver familiarizado com linguagens de programação tradicionais, pode ser útil comparar os módulos do Terraform com as definições de função:

- **Input Variables** são como argumentos de função.
- As **Output Values** são como valores de retorno de função.
- As **Local Values** são como variáveis ​​locais temporárias de uma função.

<br>

### Declarando uma Input Variable

Cada variável de entrada aceita por um módulo deve ser declarada usando um bloco `variable`:

```
variable "image_id" {
  type = string
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["us-west-1a"]
}

variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      internal = 8300
      external = 8300
      protocol = "tcp"
    }
  ]
}
```

<br>

O rótulo após a palavra-chave `variable` é um nome para a variável, que deve ser único entre todas as variáveis ​​no mesmo módulo. Este nome é usado para atribuir um valor externo à variável e para referenciar o valor da variável dentro do módulo.

O nome de uma variável pode ser qualquer identificador válido, exceto o seguinte: `source`, `version`, `provider`, `count`, `for_each`, `lifecycle`, `depende_on`, `locals`.

Esses nomes são reservados para meta-argumentos em blocos de configuração de módulo e não podem ser declarados como nomes de variáveis.

<br>

### Argumentos

O Terraform CLI define os seguintes argumentos opcionais para declarações de variáveis:

- `default` - Um valor padrão que torna a variável opcional.
- `type` - Este argumento especifica quais tipos de valor são aceitos para a variável.
- `description` - Especifica a documentação da variável de entrada.
- `validation` - Um bloco para definir regras de validação, geralmente além de restrições de tipo.
- `ephemeral` - Esta variável está disponível durante o tempo de execução, mas não é gravada em arquivos de estado ou de plano.
- `sensitive` - Limita a saída do Terraform IU quando a variável é usada na configuração.
- `nullable` - Especifique se a variável pode ser nula dentro do módulo.

<br>

### Usando Input Variable

Dentro do módulo que declarou uma variável, seu valor pode ser acessado a partir de expressões como `var.<NOME>`, onde `<NOME>` corresponde ao label fornecido no bloco de declaração:

```
resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = var.image_id
}
```

<br>

O valor atribuído a uma variável só pode ser acessado em expressões dentro do módulo onde ela foi declarada.


<br>

### Atribuindo valores às variáveis ​​do módulo raiz

Quando variáveis ​​são declaradas no módulo raiz da sua configuração, elas podem ser definidas de diversas maneiras:

- Em um workspace do HCP Terraform.
- Individualmente, com a opção de linha de comando `-var`.
- Em arquivos de definições de variáveis ​​(`.tfvars`), especificados na linha de comando ou carregados automaticamente.
- Como variáveis ​​de ambiente.

<br>

Exemplo de atribuição de valor de uma variável por linha de comando:
```
terraform plan -out=Nome_Plano -var="image_id=abc123"
```





<br>

## Saiba mais
[HashiCorp Terraform: Variables and Outputs](https://developer.hashicorp.com/terraform/language/values)   
[HashiCorp Terraform: Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)   
[HashiCorp Terraform: Output Values](https://developer.hashicorp.com/terraform/language/values/outputs)   
[HashiCorp Terraform: Local Values](https://developer.hashicorp.com/terraform/language/values/locals)   