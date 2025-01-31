# Resource Group
resource "azurerm_resource_group" "nginx-test-rg" {
  name     = "nginx-test-rg"
  location = var.azure_webapp_location
}

# Service Plan
resource "azurerm_service_plan" "nginx-test-sp" {
  name                = "nginx-test-sp"
  location            = azurerm_resource_group.nginx-test-rg.location
  resource_group_name = azurerm_resource_group.nginx-test-rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}

# Web App
resource "azurerm_linux_web_app" "nginx-test-app-do-toto" {
  name                = "nginx-test-app-do-toto"
  resource_group_name = azurerm_resource_group.nginx-test-rg.name
  location            = azurerm_service_plan.nginx-test-sp.location
  service_plan_id     = azurerm_service_plan.nginx-test-sp.id

  # O parâmetro always_on é false porque o SKU do Service Plan é F1
  site_config {
    always_on = false
    application_stack {
      docker_image_name   = "nginx:latest"
      docker_registry_url = "https://index.docker.io"
    }
  }
}

# Mostra o endereço (DNS) de acesso ao Web App
output "defaut_hostname" {
  value = azurerm_linux_web_app.nginx-test-app-do-toto.default_hostname
}