# Instalando o Terraform

<br>

Para instalar o Terraform em servidores **Ubuntu/Debian**:

```shell
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

<br>

Para instalar o Terraform em servidores **CentOS/RHEL**:

```shell
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```

<br>

## Saiba mais
[HashiCorp Terraform: Install Terraform](https://developer.hashicorp.com/terraform/install)   