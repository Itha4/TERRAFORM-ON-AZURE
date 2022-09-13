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
    key = "virtualmachine.tfstate"
  }
}

provider "azurerm" {
 
    features {}
}
data "azurerm_network_interface" "NIC1"{
    name = "networkinterface1"
    resource_group_name = "ResourceGroup-1"
}
data "azurerm_network_interface" "NIC2"{
    name = "networkinterface2"
    resource_group_name = "ResourceGroup-1"
}
locals {
  size = "Standard_F2"
  publisher = "MicrosftWindowsServer"
  offer = "WindowsServer"
  sku = "2016-Datacenter"
  version = "latest"
}
data "terraform_remote_state" "AVSET" {
  backend = "azurerm"
  config = {
    resource_group_name = "ResourceGroup-1"
    storage_account_name = "terraformstatefile444"
    container_name = "terraform"
    key = "AVSET.tfstate"
   }
}
resource "azurerm_windows_virtual_machine" "VM1"{
    name = "VM1"
    resource_group_name = var.ResourceGroup
    location = var.location
    size = local.size
    admin_username = "adminuser"
    admin_password = "TER@F0rm888"
    availability_set_id = data.terraform_remote_state.AVSET.output.avset5
    network_interface_ids = [data.azurerm_network_interface.NIC1.id,
    ]
os_disk {
caching = "ReadWrite"  
storage_account_type = "Standard_LRS"
}

source_image_reference {
  publisher = local.publisher
  offer = local.offer
  sku = local.sku
  version = local.version
}
    
}
resource "azurerm_windows_virtual_machine" "VM2" {
    name = "VM"
    resource_group_name = var.ResourceGroup
    location = var.location
    size = local.size
    admin_username = "adminuser"
    admin_password = "TER@F0rm888"
    availability_set_id = data.terraform_remote_state.AVSET.output.avset5
    network_interface_ids = [data.azurerm_network_interface.NIC2.id,
    ]   
os_disk {
caching = "ReadWrite"  
storage_account_type = "Standard_LRS"
}
}