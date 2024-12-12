# Inicializando um diretório de trabalho

O Terraform espera ser invocado a partir de um diretório de trabalho que contém arquivos de configuração escritos na linguagem Terraform. O Terraform usa o conteúdo de configuração deste diretório e também usa o diretório para armazenar configurações, plug-ins e módulos em cache e, às vezes, dados de estado.

Um diretório de trabalho deve ser inicializado antes que o Terraform possa executar qualquer operação nele (como provisionar infraestrutura ou modificar estado).

<br>

## Conteúdo do diretório de trabalho

Um diretório de trabalho do Terraform normalmente contém:

- Uma configuração do Terraform que descreve os recursos que o Terraform deve gerenciar. Espera-se que esta configuração mude com o tempo.

- Um diretório oculto `.terraform`, que o Terraform usa para gerenciar plug-ins e módulos de provedor em cache, registrar qual espaço de trabalho está ativo no momento e registrar a última configuração de back-end conhecida, caso seja necessário migrar o estado na próxima execução. Este diretório é gerenciado automaticamente pelo Terraform e criado durante a inicialização.

- Dados de estado, se a configuração usar o back-end padrão `local`. Isso é gerenciado pelo Terraform em um arquivo `terraform.tfstate` (se o diretório usar apenas o espaço de trabalho padrão) ou um diretório `terraform.tfstate.d` (se o diretório usar vários espaços de trabalho).

<br>

## Inicialização

Execute o comando `terraform init` para inicializar um diretório de trabalho que contém uma configuração do Terraform. Após a inicialização, você poderá executar outros comandos, como `terraform plan` e `terraform apply`.

Se você tentar executar um comando que depende de inicialização sem inicializar primeiro, o comando falhará com um erro e explicará que você precisa executar o `terraform init`.

A inicialização executa diversas tarefas para preparar um diretório, incluindo acessar o estado no back-end configurado, baixar e instalar plug-ins de provedor e baixar módulos. Sob algumas condições (geralmente ao mudar de um back-end para outro), ele pode solicitar orientação ou confirmação ao usuário.

<br>

## Reinicialização

Certos tipos de alterações em uma configuração do Terraform podem exigir reinicialização antes que as operações normais possam continuar. Isso inclui alterações nos requisitos do provedor, fontes de módulo ou restrições de versão e configurações de back-end.

Você pode reinicializar um diretório executando `terraform init` novamente. Na verdade, você pode reinicializar a qualquer momento; o comando `init` é idempotente e não terá efeito se nenhuma alteração for necessária.

Se a reinicialização for necessária, qualquer comando que dependa da inicialização falhará com um erro e informará isso.

<br>

## Reinicializando apenas módulos

O comando `terraform get` baixará os módulos referenciados na configuração, mas não executará as outras tarefas de inicialização necessárias. Este comando é útil apenas para fluxos de trabalho de nicho, e a maioria dos usuários do Terraform pode ignorá-lo em favor do `terraform init`.

<br>

## Saiba mais
[HashiCorp Terraform: Initializing Working Directories](https://developer.hashicorp.com/terraform/cli/init)   