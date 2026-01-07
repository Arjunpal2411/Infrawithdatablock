variable "sql_database" {
  type = map(object({
    sql_database_name   = string
    max_size_gb         = string
    sku_name            = string
    resource_group_name = string
    sql_server_name     = string
  }))
}

