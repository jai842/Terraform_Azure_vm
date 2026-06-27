terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  # subscription_id   = "5cf181b6-601f-4b75-862c-eab3098b4bf4"
  # tenant_id         = "30bf9f37-d550-4878-9494-1041656caf27"
  # client_id         = "764a2a84-99b4-4308-8446-bd4ca22871a7"
  # client_secret     = "2Ug8Q~IMPAqtXokRu7DqG-A1-gXnirhb1f8MnbJK"
}

# module "vm" {
#   source = "./modules/vm"
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   vm_name             = var.vm_name
#   admin_username     = var.admin_username
#   admin_password     = var.admin_password
# }

module "s3" {
  source = "./modules/s3"
  resource_group_name = var.resource_group_name
  location            = var.location
  storage_account_name = var.storage_account_name

}