# output "sub-nsg-ass_name" {
#       value =azurerm_subnet_network_security_group_association.app-nsg-ass.name

# }
output"sub-nsg-ass_id" {
   value = azurerm_subnet_network_security_group_association.app-sub-nsg.id
  
}
