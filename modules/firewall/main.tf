resource "azurerm_public_ip" "firewall-pubip" {
  name                = var.pubip_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = var.allocation_method        #"Static"
  sku                 = var.sku                       #"Standard"
}

resource "azurerm_firewall_policy" "firewall-pol" {
  name                = var.firewall_policy_name
  resource_group_name = var.rg_name
  location            = var.rg_location
}

resource "azurerm_firewall" "firewall" {
  name                = var.firewall_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  sku_name            = var.sku_name                  #"AZFW_VNet"
  sku_tier            = var.sku_tier                   #"Standard"
  firewall_policy_id  = azurerm_firewall_policy.firewall-pol.id

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.firewall-pubip.id

  }
}

resource "azurerm_firewall_policy_rule_collection_group" "rule-collection" {
  name               = "vpn-fwpolicy-rcg"
  firewall_policy_id = azurerm_firewall_policy.firewall-pol.id
  priority           = 500

 

  # Network Rule Collection
  network_rule_collection {
    name     = "network_rule_collection1"
    priority = 110
    action   = "Allow"

    rule {
      name                  = "network_rule_collection1_rule1"
      protocols             = ["TCP", "UDP","ICMP"]
      source_addresses      = var.on_premises_cidr
      destination_addresses = var.spoke1_cidr
      destination_ports     = ["*"]
    }
  }
  network_rule_collection {
    name     = "network_rule_collection2"
    priority = 120
    action   = "Allow"

    rule {
      name                  = "network_rule_collection1_rule2"
      protocols             = ["TCP", "UDP","ICMP"]
      source_addresses      = var.on_premises_cidr
      destination_addresses = var.spoke2_cidr
      destination_ports     = ["*"]
    }
  }
   network_rule_collection {
    name     = "network_rule_collection3"
    priority = 130
    action   = "Allow"

    rule {
      name                  = "network_rule_collection1_rule3"
      protocols             = ["TCP", "UDP","ICMP"]
      source_addresses      =  var.spoke1_cidr
      destination_addresses = var.on_premises_cidr
      destination_ports     = ["*"]
    }
  }
  network_rule_collection {
    name     = "network_rule_collection4"
    priority = 140
    action   = "Allow"

    rule {
      name                  = "network_rule_collection1_rule4"
      protocols             = ["TCP", "UDP","ICMP"]
      source_addresses      = var.spoke2_cidr
      destination_addresses = var.on_premises_cidr
      destination_ports     = ["*"]
    }
  }
 network_rule_collection {
    name     = "network_rule_collection5"
    priority = 150
    action   = "Allow"

    rule {
      name                  = "network_rule_collection1_rule5"
      protocols             = ["TCP", "UDP","ICMP"]
      source_addresses      = var.spoke1_cidr
      destination_addresses = var.spoke2_cidr
      destination_ports     = ["*"]
    }
  }
  network_rule_collection {
    name     = "network_rule_collection6"
    priority = 160
    action   = "Allow"

    rule {
      name                  = "network_rule_collection1_rule6"
      protocols             = ["TCP", "UDP","ICMP"]
      source_addresses      =var.spoke2_cidr
      destination_addresses = var.spoke1_cidr
      destination_ports     = ["*"]
    }  
}

  network_rule_collection {
    name     = "appgw-spokes"
    priority = 170
    action   = "Allow"

    rule {
      name                  = "appgw-sp1-sp2"
      protocols             = ["TCP", "UDP","ICMP"]
      source_addresses      = var.appgw_address_prefix
      destination_addresses = var.destination_addresses
      destination_ports     = ["*"]
    }  
}
}

resource "azurerm_firewall_nat_rule_collection" "dnat-rule" {
  name                = "dnatrule-vm1"
  azure_firewall_name = azurerm_firewall.firewall.name
  resource_group_name = var.rg_name
  priority            = 100
  action              = "Dnat"

  rule {
    name = "dnatrule-app1"

    source_addresses = [
      "*",
    ]

    destination_ports = [
      "3389",
    ]

    destination_addresses = [
      azurerm_public_ip.firewall-pubip.ip_address
    ]

    translated_port = 3389

    translated_address = var.vm1_pvt_ip

    protocols = [
      "TCP",
      "UDP",
    ]
  }
}