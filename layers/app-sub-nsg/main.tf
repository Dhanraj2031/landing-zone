module "app-sub-nsg" {
    source = "../../modules/app-sub-nsg"
    subnet_id = module.app-sub.subnet_ids["snet4"]
    network_security_group_id = module.appgw-nsg.nsg_id
}

module "app-sub" {
    source = "../../truth_module/hub-vnet" 
}
module "appgw-nsg" {
    source = "../../truth_module/appgw-nsg"
  
}