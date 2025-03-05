data "terraform_remote_state" "app-sub-nsg" {
    backend = "azurerm"
    config = {
    resource_group_name = "va-rg-dev-backend"
    storage_account_name = "vastdevbackend"
    container_name = "tfstate"
    key = "app-sub-nsg/default.tfstate"   
    }
    }
  

output "sub-nsg-ass_id" {
  value = data.terraform_remote_state.app-sub-nsg.outputs.sub-nsg-ass_id
}