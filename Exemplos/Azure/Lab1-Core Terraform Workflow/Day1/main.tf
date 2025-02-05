terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "contoso_rg" {
  name = "contoso_rg"
  location = "East US 2"

  tags = {
    cost_center = "constoso research"
  }
}

