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
 
    features {}
    
    }
#Terraform  blocks take on the format of ‘resource type’ and ‘resource name’

  resource "azurerm_resource_group" "example" {
  name     = "ResourceGroup01"
  location = "West Europe"
}



 


 