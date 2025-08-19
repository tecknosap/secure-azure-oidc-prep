terraform {
  required_version = ">= 1.6.6"

  backend "azurerm" {
    resource_group_name  = "rg-gocloudops-terraform-backend"
    storage_account_name = "gocloudopstfstate"
    container_name       = "tfstate"
    key                  = "devsecops-poc2.tfstate"
    #arm_use_oidc        = true   # Uncomment if using OIDC for authentication
  }
}