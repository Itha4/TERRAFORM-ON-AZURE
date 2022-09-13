terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.16.0"
    }
  }
    backend "azurerm" {
    resource_group_name = "ResourceGroup-1"
    storage_account_name = "terraformstatefile444"
    container_name = "terraform"
    key = "subnet.tfstate"
  }
}

#Configure the Microsft Azure Provider
provider "azurerm" {
  #To use ServicePrincipal to authenticate store it as as an environment variable then export it for use in terraform.
    features {}    
 
 }
 variable "RGName" {
   type = string
   default = "ResourceGroup-1"
 }
 variable "VNETName" {
   type = string
   default = "virtualNetwork1"
 }
 resource "azurerm_subnet" "subnet1" {
   name = "Prod"
   resource_group_name = var.RGName
   virtual_network_name =var.VNETName
   address_prefixes = ["10.0.1.0/24"]
 }
 resource "azurerm_subnet" "subnet2" {
   name = "Dev"
   resource_group_name = var.RGName
   virtual_network_name =var.VNETName
   address_prefixes = ["10.0.2.0/24"]
 }