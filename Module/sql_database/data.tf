data "azurerm_mssql_server" "indiansqlserver" {
  for_each            = var.sql_database
  name                = each.value.sql_server_name
  resource_group_name = each.value.resource_group_name
}
