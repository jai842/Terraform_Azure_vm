# resource "azurerm_resource_group" "rg" {
#   name     = "shiva-rg"
#   location = "eastus"
# }

# resource "azurerm_resource_group" "rga" {
#   name     = "Ramarao-rg"
#   location = "eastus"
# }

resource "azurerm_storage_account" "exam1" {
  name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"

 tags = {
    environment = "dev"
 } 
}


# resource "azurerm_storage_account" "exam2" {
#   name = "dvedss"
#   resource_group_name = var.resource_group_name
#   location = var.location
#   account_tier = "Standard"
#   account_replication_type = "LRS"

#  tags = {
#     environment = "dev"
#  } 
# }



resource "azurerm_private_endpoint" "pt01" {
  name = "pvt11"
  resource_group_name = var.resource_group_name
  location = var.location
  subnet_id = data.azurerm_subnet.subnet.id

  private_service_connection {
    name = "pvtcon"
    private_connection_resource_id = azurerm_storage_account.exam1.id
    is_manual_connection = false

    subresource_names = ["blob"]
  }
}