nsg_name = "appgw-nsg"
nsg_rules = {
  nsg1 = {
    name = "test-123"
    priority = "100"
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "3389"
    destination_port_range = "*"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    
  }
nsg2 =  {
    name                       = "Allow-Internet-Inbound"
    priority                   = "120"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "Internet"
  }

 nsg3 =  {
    name                       = "Allow-GatewayManager"
    priority                   = "130"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "65200-65535"
    source_address_prefix      = "GatewayManager"
    destination_address_prefix = "*"
  }
 
  nsg4 =  {
    name                       = "Allow-HTTP"
    priority                   = "140"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
 
  nsg5 =  {
    name                       = "Allow-Internet-Outbound"
    priority                   = "150"
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "Internet"
  }
}