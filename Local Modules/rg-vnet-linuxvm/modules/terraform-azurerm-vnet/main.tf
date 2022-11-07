
resource "random_string" "random" {
  min_lower   = 2
  min_upper   = 2
  min_numeric = 2
  length      = 6
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.vnet_address_space
  tags                = var.tags
}

resource "azurerm_subnet" "snet" {
  for_each             = var.subnets
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  name                 = "${var.business_unit_prefix}-${var.environment_prefix}-${each.key}-${random_string.random.result}"
  address_prefixes     = each.value.subnet
}
