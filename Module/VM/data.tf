data "azurerm_public_ip" "pip" {
  for_each            = var.indianVMs
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "IndiaSubnet" {
  for_each             = var.indianVMs
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
