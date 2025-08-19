terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    
  }
   subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "prep" {
  
name = var.rg_name
location = var.location
}



resource "azurerm_virtual_network" "vnet1" {
  name = var.vnet_name
  resource_group_name = azurerm_resource_group.prep.name
  location = azurerm_resource_group.prep.location
  address_space = [var.vnet_address_space]
}
resource "azurerm_subnet" "subnet1" {
  name = var.subnet1_name
  resource_group_name = azurerm_resource_group.prep.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes = [var.subnet1_prefix]
  
}

resource "azurerm_subnet" "subnet2" {
  name = var.subnet1_name
  resource_group_name = azurerm_resource_group.prep.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes = [var.subnet2_prefix]
  
}