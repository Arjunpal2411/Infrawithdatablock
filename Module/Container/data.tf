data "azurerm_storage_account" "Centralstg" {
  for_each            = var.CentralStgCont
  name                = each.value.storage_account_name
  resource_group_name = each.value.resource_group_name
}
