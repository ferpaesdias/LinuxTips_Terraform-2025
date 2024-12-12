# Estado (State)

O Terraform deve armazenar o estado sobre sua infraestrutura e configuração gerenciadas. Este estado é usado pelo Terraform para mapear recursos do mundo real para sua configuração, acompanhar metadados e melhorar o desempenho de grandes infraestruturas.

Esse estado é armazenado por padrão em um arquivo local chamado `terraform.tfstate`, mas recomendamos armazená-lo no *HCP Terraform* ou em um provedor de nuvem (AWS, Azure, etc) para versionar, criptografar e compartilhar com segurança com sua equipe.

O Terraform usa o estado para determinar quais alterações fazer na sua infraestrutura. Antes de qualquer operação, o Terraform faz uma atualização para atualizar o estado com a infraestrutura real.

O objetivo principal do estado do Terraform é armazenar ligações entre objetos em um sistema remoto e instâncias de recursos declaradas em sua configuração. Quando o Terraform cria um objeto remoto em resposta a uma mudança de configuração, ele registrará a identidade desse objeto remoto em uma instância de recurso específica e, em seguida, atualizará ou excluirá potencialmente esse objeto em resposta a futuras alterações de configuração.

<br>

## Inspeção e Modificação

Embora o formato dos arquivos de estado seja apenas JSON, a edição direta do arquivo do estado é desencorajada. Terraform fornece o comando `terraform state` para realizar modificações básicas do estado usando a CLI.

O uso da CLI e a saída dos comandos de estado são estruturados para serem amigáveis ​​para ferramentas Unix, como grep, awk, etc. Além disso, a CLI isola os usuários de quaisquer alterações de formato dentro do próprio estado. O projeto Terraform manterá a CLI funcionando enquanto o formato do estado abaixo dela pode mudar.

O Terraform espera um mapeamento individual entre instâncias de recursos configuradas e objetos remotos. Normalmente isso é garantido pelo Terraform ser quem cria cada objeto e registra sua identidade no estado, ou destrói um objeto e depois remove a ligação dele.

Se você adicionar ou remover vinculações no estado por outros meios, como importando objetos criados externamente com `terraform import` ou pedindo ao Terraform para "esquecer" um objeto existente com `terraform state rm`, você precisará garantir por si mesmo que esta regra um-para-um seja seguida, como excluir manualmente um objeto que você pediu ao Terraform para "esquecer" ou reimportá-lo para vinculá-lo a alguma outra instância de recurso.

<br>

## Formato

Os snapshots de estado (state snapshots) são armazenados no formato JSON e as novas versões do Terraform geralmente são compatíveis com versões anteriores dos snapshots de estado produzidos por versões anteriores. No entanto, o formato de estado está sujeito a alterações em novas versões do Terraform, portanto, se você criar um software que o analisa ou modifica diretamente, deverá realizar a manutenção contínua desse software à medida que o formato de estado evolui em novas versões.

Alternativamente, existem vários pontos de integração que produzem saída JSON especificamente destinada ao consumo por software externo:

- O comando `terraform output` tem uma opção `-json`, para obter o conjunto completo de valores de saída do módulo raiz ou um valor de saída nomeado específico do instantâneo de estado mais recente.

- O comando `terraform show` tem uma opção `-json` para inspecionar completamente o instantâneo do estado mais recente e também para inspecionar arquivos de plano salvos que incluem uma cópia do estado anterior no momento em que o plano foi feito.

Uma maneira típica de usá-los em situações em que o Terraform está sendo executado em automação é executá-los imediatamente após a execução bem-sucedida do `terraform apply` para obter uma representação do instantâneo do estado mais recente e, em seguida, armazenar esse resultado como um artefato associado à execução automatizada para que outro o software pode potencialmente consumi-lo sem a necessidade de executar o próprio Terraform.

<br>

## Saiba mais
[HashiCorp Terraform: State](https://developer.hashicorp.com/terraform/language/state)   