# Resource Group
resource "azurerm_resource_group" "vm-teste-rg" {
  name     = "vm-teste-rg"
  location = var.azure_vm_location
}

# VNet
resource "azurerm_virtual_network" "vm-teste-vnet" {
  name                = "vm-teste-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.vm-teste-rg.location
  resource_group_name = azurerm_resource_group.vm-teste-rg.name
}

# Subnet
resource "azurerm_subnet" "vm-teste-subnet" {
  name                 = "vm-teste-subnet"
  resource_group_name  = azurerm_resource_group.vm-teste-rg.name
  virtual_network_name = azurerm_virtual_network.vm-teste-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# IP Público
resource "azurerm_public_ip" "vm-teste-pip" {
  name = "vm-teste-pip"
  location = azurerm_resource_group.vm-teste-rg.location
  resource_group_name = azurerm_resource_group.vm-teste-rg.name
  allocation_method = "Dynamic"
}

# NSG
resource "azurerm_network_security_group" "vm-teste-nsg" {
  name = "vm-teste-nsg"
  location =  azurerm_resource_group.vm-teste-rg.location
  resource_group_name = azurerm_resource_group.vm-teste-rg.name

  security_rule = {
    name  = "SSH"
    priority = 1001
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
}

# Interface de rede
resource "azurerm_network_interface" "vm-teste-netinterface" {
  name                = "vm-teste-netinterface"
  location            = azurerm_resource_group.vm-teste-rg.location
  resource_group_name = azurerm_resource_group.vm-teste-rg.name

  # IP da interface de rede
  ip_configuration {
    name                          = "ip-interface"
    subnet_id                     = azurerm_subnet.vm-teste-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.vm-teste-pip.id
  }
}

# VM
resource "azurerm_linux_virtual_machine" "vm-teste-vm" {
  name                            = "vm-teste-vm"
  resource_group_name             = azurerm_resource_group.vm-teste-rg.name
  location                        = azurerm_resource_group.vm-teste-rg.location
  size                            = "Standard_B1ls"
  disable_password_authentication = false
  admin_username                  = "adminuser"
  admin_password                  = var.azure_vm_admin_password
  network_interface_ids = [
    azurerm_network_interface.vm-teste-netinterface.id,
  ]

  # Disco do SO
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Imagem da VM
  source_image_reference {
    publisher = "Debian"
    offer     = "debian-12"
    sku       = "12"
    version   = "latest"
  }

  # Tags
  tags = {
    App = "Terraform"
    Uso = "Terraform-Statefile"
  }
}

