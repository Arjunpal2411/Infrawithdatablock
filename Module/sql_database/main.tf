resource "azurerm_mssql_database" "sqldb" {
  for_each    = var.sql_database
  name        = each.value.sql_database_name
  server_id   = data.azurerm_mssql_server.indiansqlserver[each.key].id
  max_size_gb = each.value.max_size_gb
  sku_name    = each.value.sku_name
}
