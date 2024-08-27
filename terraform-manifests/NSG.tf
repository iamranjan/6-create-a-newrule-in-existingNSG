#Create NSG

resource "azurerm_network_security_group" "NSG_on_vnet" {
  name                = local.nsg_name
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  security_rule {
    name                       = "AllowInbound80"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "10.0.0.8"
    destination_address_prefix = "10.2.0.1"
  }

  security_rule {
    name                       = "AllowOutbound80to10-0-0-8"
    priority                   = 220
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "10.2.0.1"
    destination_address_prefix = "10.0.0.8"
  }
}


