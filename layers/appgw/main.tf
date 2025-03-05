module "appgw" {
    source = "../../modules/appgw"
    appgw_name = var.appgw_name
    rg_name = module.rg.rg_name
    rg_location = module.rg.rg_location
    frontend_ip_configuration_name = var.frontend_ip_configuration_name
    frontend_port_name = var.frontend_port_name
    listener_name = var.listener_name
    subnet_id = module.app_sub.subnet_ids["snet4"]
    public_ip_address_id =module.app_pip.app_pip_id
    request_routing_rule_name = var.request_routing_rule_name
    http_setting_name = var.http_setting_name
    backend_address_pool_name = var.backend_address_pool_name
    vm_private_ip =  concat(
  values(module.vm1_pvt_ip.s1_vm_private_ips),
  values(module.vm2_pvt_ip.s2_vm_private_ips))

    cookie_based_affinity = var.cookie_based_affinity
    sku_name = var.sku_name 
    sku_tier = var.sku_tier
    protocol = var.protocol
    rule_type = var.rule_type
    gateway_ip_configuration_name = var.gateway_ip_configuration_name
    
}

module "rg" {
    source = "../../truth_module/rg"
  
}

module "app_sub" {
    source = "../../truth_module/hub-vnet"
  
}
module "app_pip" {
    source = "../../truth_module/app_pip"
  
}
module "vm1_pvt_ip" {
    source = "../../truth_module/s1vm"
  
}
module "vm2_pvt_ip" {
    source ="../../truth_module/s2vm"
  
}
