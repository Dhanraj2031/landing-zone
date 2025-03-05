variable "appgw_name" {
    type = string
  
}
# variable "rg_name" {
#     type = string
  
# }
# variable "rg_location" {
#   type = string
# }
# variable "subnet_id" {
#   type = string
# }
variable "frontend_port_name" {
    type = string
  
}
variable "frontend_ip_configuration_name" {
    type = string
  
}
# variable "public_ip_address_id" {
#     type = string
  
# }

variable "backend_address_pool_name" {
  type = string
}
variable "http_setting_name" {
    type = string
  
}
variable "listener_name" {
    type = string
  
}
variable "request_routing_rule_name" {
    type = string
  
}
variable "protocol" {
  type = string
}
variable "sku_name" {
    type = string
  
}
variable "sku_tier" {
    type = string
  
}
variable "gateway_ip_configuration_name" {
    type = string
  
}
variable "cookie_based_affinity" {
  type = string
}
variable "rule_type" {
  type = string
}
