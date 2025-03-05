variable "nsg_name" {
    type = string
  
}
variable "rg_name" {
    type = string
  
}
variable "rg_location" {
    type = string
  
}


variable "nsg_rules" {
    type = map(object({
      name = string
      priority = string
      direction = string
      access = string
      protocol = string
      source_port_range = string
      destination_port_range = string
      source_address_prefix = string
      destination_address_prefix = string
    }))
  
}