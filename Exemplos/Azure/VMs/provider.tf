terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.1.0"
    }
  }
}

# Configuração do MS Azure Provider
provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}