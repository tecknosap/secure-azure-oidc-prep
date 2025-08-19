# Resource Group
variable "rg_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "myResourceGroup"
}

# Location
variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "eastus"
}

# Virtual Network
variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "myVNet"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = string
  default = "10.0.0.0/16"
}

# Subnets
variable "subnet1_name" {
  description = "Name of the first subnet"
  type        = string
  default     = "subnet1"
}

variable "subnet1_prefix" {
  description = "Address prefix for the first subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet2_name" {
  description = "Name of the second subnet"
  type        = string
  default     = "subnet2"
}

variable "subnet2_prefix" {
  description = "Address prefix for the second subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "subscription_id" {
    description = "place holder for our subscription"
    type = string  ######
}
