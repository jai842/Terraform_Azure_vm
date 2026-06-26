


resource "azurerm_public_ip" "example1" {
  name                = "example-pip2"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_network_security_group" "linux_nsg" {
  name                = "linux1-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "example2" {
  name                = "example-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example1.id
  }
}

resource "azurerm_network_interface_security_group_association" "example3" {
  network_interface_id      = azurerm_network_interface.example2.id
  network_security_group_id = azurerm_network_security_group.linux_nsg.id
}

resource "azurerm_linux_virtual_machine" "example4" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B2als_V2"
  admin_username      = var.admin_username
  admin_password = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.example2.id,
  ]

  # admin_ssh_key {
  #   username   = "jayaram"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }
  

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  #   source_image_reference {
  #   publisher = "RedHat"
  #   offer     = "RHEL"
  #   sku       = "9-lvm-gen2"
  #   version   = "latest"
  # }
}


