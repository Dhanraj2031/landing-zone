data "terraform_remote_state" "s2vm" {
    backend = "azurerm"
    config = {
    resource_group_name = "va-rg-dev-backend"
    storage_account_name = "vastdevbackend"
    container_name = "tfstate"
    key = "s2vm/default.tfstate"   
    }
  
}

output "s2_vm_ids" {
  value = data.terraform_remote_state.s2vm.outputs.s2_vm_id
}   

output "s2_vm_nic_ids" {
  value = data.terraform_remote_state.s2vm.outputs.s2_vm_nic_id
}   


output "s2_vm_private_ips" {
  value = data.terraform_remote_state.s2vm.outputs.s2_vm_private_ip
}   

output "s2_nsg_ids" {
  value = data.terraform_remote_state.s2vm.outputs.s2_nsg_ids
}
