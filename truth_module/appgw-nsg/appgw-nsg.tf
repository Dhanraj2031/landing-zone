data "terraform_remote_state" "appgw-nsg" {
    backend = "azurerm"
    config = {
    resource_group_name = "va-rg-dev-backend"
    storage_account_name = "vastdevbackend"
    container_name = "tfstate"
    key = "appgw-nsg/default.tfstate"   
    }
    }
  


output "nsg_name" {
  value = data.terraform_remote_state.appgw-nsg.outputs.nsg_name
}

output "nsg_id" {
  value = data.terraform_remote_state.appgw-nsg.outputs.nsg_id
}