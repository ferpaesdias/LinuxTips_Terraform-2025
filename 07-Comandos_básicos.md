# Comandos básicos

<br>

## terraform init

O comando `terraform init` inicializa um diretório de trabalho contendo arquivos de configuração do Terraform. Este é o primeiro comando que deve ser executado após escrever uma nova configuração do Terraform ou clonar uma existente a partir do controle de versão. É seguro executar este comando várias vezes.

<br>

```
terraform init --upgrade
```
- `--upgrade`: Atualiza módulos e plug-ins como parte de suas respectivas etapas de instalação. 

<br>

## terraform plan

O comando `terraform plan` cria um plano de execução, que permite visualizar as alterações que o Terraform planeja fazer em sua infraestrutura. Por padrão, quando o Terraform cria um plano, ele:

- Lê o estado atual de quaisquer objetos remotos já existentes para garantir que o estado do Terraform esteja atualizado.

- Compara a configuração atual com o estado anterior e observa quaisquer diferenças.

- Propõe um conjunto de ações de mudança que devem, se aplicadas, fazer com que os objetos remotos correspondam à configuração.

<br>

```
terraform plan -out=Nome_Plano
```
- `-out=Nome_Plano`: A opção opcional `-out=Nome_Plano` para salvar o plano gerado em um arquivo no disco, que pode ser executado posteriormente, passando o arquivo para terraform apply como um argumento extra. Este fluxo de trabalho de duas etapas destina-se principalmente à execução do Terraform em automação.

<br>

## terraform apply

O comando `terraform apply` executa as ações propostas em um plano Terraform.


```
terraform apply "Nome_Plano"
```

<br>

## terraform destroy

O comando `terraform destroy` é uma maneira conveniente de destruir todos os objetos remotos gerenciados por uma configuração específica do Terraform.

Embora normalmente você não queira destruir objetos de longa duração em um ambiente de produção, o Terraform às vezes é usado para gerenciar infraestrutura efêmera para fins de desenvolvimento; nesse caso, você pode usar o `terraform destroy` para limpar convenientemente todos esses objetos temporários quando terminar com seu trabalho.

<br>

```
terraform destroy
```

<br>

O comando `terraform destroy` é apenas um alias conveniente para o seguinte comando:

```
terraform apply -destroy
```

<br>

Por esse motivo, este comando aceita a maioria das opções que o `terraform apply` aceita, embora não aceite um argumento de arquivo de plano e force a seleção do modo de planejamento "destroy".

Você também pode criar um plano de destroy especulativo, para ver qual seria o efeito da destroy, executando o seguinte comando:

```
terraform plan -destroy -out=Nome_Plano_Destroy
```

<br>

Isso executará o `terraform plan` no modo destroy, mostrando as alterações destroy propostas sem executá-las e irá criar um plano de "destruição" chamado `Nome_Plano_Destroy`.

Usando o comando `terraform apply` é possível executar o plano de "destruição `Nome_Plano_Destroy`:

```
terraform apply "Nome_Plano_Destroy"
```

<br>

## Saiba mais
[HashiCorp Terraform: Command: init](https://developer.hashicorp.com/terraform/cli/commands/init)   
[HashiCorp Terraform: Command: apply](https://developer.hashicorp.com/terraform/cli/commands/apply)   
[HashiCorp Terraform: Command: destroy](https://developer.hashicorp.com/terraform/cli/commands/destroy)   