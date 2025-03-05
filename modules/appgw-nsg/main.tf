resource "azurerm_network_security_group" "appgw-nsg" {
    name = var.nsg_name
    location = var.rg_location
    resource_group_name = var.rg_name
 
   dynamic "security_rule" {
    for_each = var.nsg_rules
    iterator = nsg_rules
    content {
      name                       = nsg_rules.key
      priority                   = nsg_rules.value.priority
      direction                  = nsg_rules.value.direction
      access                     = nsg_rules.value.access
      protocol                   = nsg_rules.value.protocol
      source_port_range          = nsg_rules.value.source_port_range
      destination_port_range     = nsg_rules.value.destination_port_range
      source_address_prefix      = nsg_rules.value.source_address_prefix
      destination_address_prefix = nsg_rules.value.destination_address_prefix
    }
  }
}