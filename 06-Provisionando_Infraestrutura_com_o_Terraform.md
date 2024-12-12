# Provisionando Infraestrutura com o Terraform

<br>

A principal função do Terraform é *criar*, *modificar* e *destruir* recursos de infraestrutura para corresponder ao estado desejado descrito em uma configuração do Terraform.

Quando as pessoas se referem a “executar o Terraform”, geralmente se referem à execução dessas ações de provisionamento para afetar objetos de infraestrutura reais. O binário do Terraform possui muitos outros subcomandos para uma ampla variedade de ações administrativas, mas essas tarefas básicas de provisionamento são o núcleo do Terraform.

O fluxo de trabalho de provisionamento do Terraform depende de três comandos: `plan`, `apply` e `destroy`. Todos esses comandos requerem um diretório de trabalho inicializado e todos eles atuam somente no espaço de trabalho atualmente selecionado.

<br>

## Planejamento (Planning)

O comando `terraform plan` avalia uma configuração do Terraform para determinar o estado desejado de todos os recursos que ele declara e, em seguida, compara esse estado desejado com os objetos de infraestrutura reais que estão sendo gerenciados com o diretório de trabalho e espaço de trabalho atuais. Ele usa dados de estado state para determinar quais objetos reais correspondem a quais recursos declarados e verifica o estado atual de cada recurso usando a API do provedor de infraestrutura relevante.

Uma vez determinada a diferença entre o estado atual e o estado desejado, o `terraform plan` apresenta uma descrição das mudanças necessárias para atingir o estado desejado. Não realiza nenhuma alteração real em objetos de infraestrutura do mundo real; apresenta apenas um plano para fazer mudanças.

Os planos geralmente são executados para validar as alterações de configuração e confirmar se as ações resultantes são as esperadas. No entanto, o `terraform plan` também pode salvar seu plano como um artefato executável, que o `terraform apply` pode usar para realizar exatamente essas alterações.

<br>

## Aplicando (Applying)

O comando `terraform apply` executa um plano exatamente como o `terraform plan`, mas na verdade executa as alterações planejadas em cada recurso usando a API do provedor de infraestrutura relevante. Ele pede a confirmação do usuário antes de fazer qualquer alteração, a menos que tenha sido explicitamente solicitado a ignorar a aprovação.

Por padrão, o `terraform apply` executa um novo plano antes de aplicar as alterações e exibe o plano ao usuário ao solicitar confirmação. No entanto, ele também pode aceitar um arquivo de plano produzido pelo terraform plan em vez de executar um novo plano. Você pode usar isso para executar com segurança um conjunto exato de alterações pré-aprovadas, mesmo que a configuração ou o estado da infraestrutura real tenha mudado em minutos desde que o plano original foi criado.

<br>

## Destruindo (Destroying)

O comando `terraform destroy` destrói todos os recursos gerenciados pelo diretório de trabalho e espaço de trabalho atuais, usando dados de estado para determinar quais objetos do mundo real correspondem aos recursos gerenciados. Assim como o `terraform apply`, ele pede confirmação antes de prosseguir.

Uma destruição se comporta exatamente como excluir todos os recursos da configuração e depois executar uma aplicação, exceto que não requer edição da configuração. Isto é mais conveniente se você pretende provisionar recursos semelhantes posteriormente.

<br>

## Saiba mais
[HashiCorp Terraform: Provisioning Infrastructure with Terraform](https://developer.hashicorp.com/terraform/cli/run)   