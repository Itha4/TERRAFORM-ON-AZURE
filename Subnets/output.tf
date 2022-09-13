output "DevSubnet" {
    description = " this is the dev subnet ID"
    value = azurerm_subnet.subnet2.id
  
}
output "ProdSubnet" {
  description = "this is teh prod subnet ID"
  value = azurerm_subnet.subnet1
}