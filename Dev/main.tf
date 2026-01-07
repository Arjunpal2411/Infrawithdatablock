module "resource_group_name" {
  source              = "../Module/ResourceGroup"
  resource_group_name = var.resource_group_name
}
module "azurerm_storage_account" {
  depends_on              = [module.resource_group_name]
  source                  = "../Module/azurerm_storage_account"
  azurerm_storage_account = var.azurerm_storage_account
}
module "CentralStgCont" {
  source         = "../Module/Container"
  depends_on     = [module.azurerm_storage_account]
  CentralStgCont = var.CentralStgCont
}
module "centralvnet" {
  source      = "../Module/Vnet"
  depends_on  = [module.resource_group_name]
  centralvnet = var.centralvnet
}
module "IndiaSubnet" {
  source        = "../Module/Subnet"
  depends_on    = [module.centralvnet]
  centralsubnet = var.IndiaSubnet

}
module "indianVMs" {
  source     = "../Module/VM"
  indianVMs  = var.indianVMs
  depends_on = [module.IndiaSubnet]
}
module "sql_server" {
  source     = "../Module/sql_server"
  sql_server = var.sql_server
  depends_on = [module.resource_group_name]
}
module "sql_database" {
  source       = "../Module/sql_database"
  sql_database = var.sql_database
  depends_on   = [module.sql_server]
}
module "pip" {
  source     = "../Module/pip"
  depends_on = [module.resource_group_name]
  public_ips = var.public_ips
}

