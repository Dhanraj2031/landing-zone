module "appgw-nsg" {
    source = "../../modules/appgw-nsg"
    nsg_name = var.nsg_name
    nsg_rules = var.nsg_rules
    rg_name = module.rg.rg_name
    rg_location =module.rg.rg_location
}

module "rg" {
  source = "../../truth_module/rg"
}
