terraform {
  backend "azurerm" {
    resource_group_name   = "resourcegroupforstatefile"
    storage_account_name  = "mytfstate987612345"
    container_name        = "tfstate"
    key                   = "env/nsg/terraform.tfstate"  # This is the name of the state file
  }
}
