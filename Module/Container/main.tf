resource "azurerm_storage_container" "Centralstgcontainer" {
  for_each              = var.CentralStgCont
  name                  = each.value.container_name
  storage_account_id    = data.azurerm_storage_account.Centralstg[each.key].id
  container_access_type = each.value.container_access_type
}
