resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# resource "azurerm_resource_group" "rga" {
#   name     = "Ramarao-rg"
#   location = "eastus"
# }

resource "azurerm_storage_account" "exam1" {
  name = var.storage_account_name
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"

 tags = {
    environment = "production"
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

# resource "azurerm_network_security_group" "example" {
#   name                = "example-security-group"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnetone"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}
resource "azurerm_private_endpoint" "pt01" {
  name = "pvt1234"
  resource_group_name = var.resource_group_name
  location = var.location
  subnet_id = azurerm_subnet.subnet1.id

  private_service_connection {
    name = "pvtconone"
    private_connection_resource_id = azurerm_storage_account.exam1.id
    is_manual_connection = false

    subresource_names = ["blob"]
  }
}