terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.16.0"
    }
  }
}

#Configure the Microsft Azure Provider
provider "azurerm" {
  #To use ServicePrincipal to authenticate store it as as an environment variable then export it for use in terraform.
    features {}
    
 
 }
 resource "azurerm_resource_group" "resourceGroup" {
    name = "ResourceGroup-1"
    location = "West Europe"
   
 }

 resource "azurerm_virtual_network" "virtualNetwork" {
   
   name = "virtualNetwork1"
   location = azurerm_resource_group.resourceGroup.location
   resource_group_name = azurerm_resource_group.resourceGroup.name
   address_space = ["10.0.0.0/16"]
 }