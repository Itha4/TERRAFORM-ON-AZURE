variable "ResourceGroup" {
  type = string
  default = "ResourceGroup-1"
  description = "this is used for naming the resource group to be used for the project"
}
variable "location" {
  type = string
  default = "West Europe"
  description = "this is the location where resources under this resource group will be provisioned"  
}



az login
az set account -s 'xxxxxxx-xxxx-xxxxx-xxxxxxxxxxxx'
# 's' is used for subscription ID or subscription name