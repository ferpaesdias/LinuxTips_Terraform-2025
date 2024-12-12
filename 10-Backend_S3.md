# Backend - S3

<br>

Armazena o estado como uma determinada chave em um determinado bucket no Amazon S3.

Esse backend também oferece suporte ao bloqueio de estado (state locking) e à verificação de consistência por meio do Dynamo DB, que pode ser ativado definindo o campo `dynamodb_table` como um nome de tabela existente do DynamoDB. Uma única tabela do DynamoDB pode ser usada para bloquear vários arquivos de estado remoto.

O Terraform gera nomes de chaves que incluem os valores do `bucket` e variáveis `key`.

<br>

>[!Warning]
É altamente recomendável ativar o controle de versão do bucket no bucket S3 para permitir a recuperação do estado em caso de exclusões acidentais e erro humano.

<br>

## Exemplo de configuração

```
terraform {
  backend "s3" {
    bucket = "example-bucket"
    key    = "path/to/state"
    region = "us-east-1"
  }
}

```
Isso pressupõe que temos um bucket criado chamado `mybucket`. O estado do Terraform é gravado no caminho da `path/to/my/key`.

<br>

## Armazenamento de estado

O backend S3 armazena dados de estado em um objeto S3 no caminho definido pelo parâmetro `key` no bucket S3 indicado pelo parâmetro bucket. Usando o exemplo mostrado acima, o estado seria armazenado no caminho `path/to/my/key` no bucket `mybucket`.

Ao usar *workspace*, o estado do workspace `default` é armazenado no local descrito acima. Outros workspace são armazenados usando o caminho `<workspace_key_prefix>/<workspace_name>/<key>`. O prefixo da chave do workspace padrão é `env:` e pode ser configurado usando o parâmetro `workspace_key_prefi`x. Usando o exemplo acima, o estado o workspace `development` seria armazenado no caminho `env:/development/path/to/my/key`.

<br>

## Permissões requiridas

Quando não estiver usando workspace (ou apenas usando o workspace `default`), o Terraform precisará das seguintes permissões AWS IAM no bucket de backend de destino:

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::mybucket"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": [
        "arn:aws:s3:::mybucket/path/to/my/key",
        "arn:aws:s3:::mybucket/path/to/my/key.tflock"
      ]
    }
  ]
}

```

>[!Note]
`s3:DeleteObject` não é necessário, pois o Terraform não excluirá o armazenamento de estado.

<br>

Ao usar workspaces, o Terraform também precisará de permissões para criar, listar, ler, atualizar e excluir o armazenamento de estado do workspace:

- `s3:ListBucket` em `arn:aws:s3:::mybucket`. No mínimo, isso deve ser capaz de listar o caminho onde o workspace `default` está armazenado, bem como os outros workspaces.

- `s3:GetObject` em `arn:aws:s3:::mybucket/path/to/my/key`, `arn:aws:s3:::mybucket/<workspace_key_prefix>/*/path/to/my/key` e `arn:aws: s3:::mybucket/<workspace_key_prefix>/*/path/to/my/key.tflock`

- `s3:PutObject` em `arn:aws:s3:::mybucket/path/to/my/key`, `arn:aws:s3:::mybucket/<workspace_key_prefix>/*/path/to/my/key` e `arn:aws: s3:::mybucket/<workspace_key_prefix>/*/path/to/my/key.tflock`

- `s3:DeleteObject` em `arn:aws:s3:::mybucket/<workspace_key_prefix>/*/path/to/my/key` e `arn:aws:s3:::mybucket/<workspace_key_prefix>/*/path/to/my/ chave.tflock`

<br>

>[!Note]
A AWS pode controlar o acesso a buckets S3 com políticas IAM anexadas a usuários/grupos/funções (como o exemplo acima) ou políticas de recursos anexadas a objetos de bucket (que parecem semelhantes, mas também exigem que um `Principal` indique qual entidade tem essas permissões). 

<br>

## Saiba mais
[HashiCorp Terraform: Backend S3](https://developer.hashicorp.com/terraform/language/backend/s3)   