# data "azurerm_virtual_network" "vnet01" {
#   name = "nani-vnet"
#   resource_group_name = var.resource_group_name
  
# }

# data "azurerm_subnet" "subnet" {
#   name = "default"
#   resource_group_name = var.resource_group_name
#   virtual_network_name = data.azurerm_virtual_network.vnet01.name

# }