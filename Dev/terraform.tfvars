resource_group_name = {
  rg1 = {
    name     = "Noida"
    location = "CentralIndia"
  }
  rg2 = {
    name     = "Gurugram"
    location = "CentralIndia"
  }
}

azurerm_storage_account = {
  stg1 = {
    depends_on           = "rg1"
    storage_account_name = "sanoidastg01"
    location             = "CentralIndia"
    resource_group_name  = "Noida"
    sku                  = "Standard_LRS"
  }
  stg2 = {
    depends_on           = "rg2"
    storage_account_name = "sagurugramstg55"
    location             = "CentralIndia"
    resource_group_name  = "Gurugram"
    sku                  = "Standard_LRS"
  }
}

CentralStgCont = {
  CentralStgCont1 = {
    container_name        = "noidacont"
    resource_group_name   = "Noida"
    storage_account_name  = "sanoidastg01"
    location              = "CentralIndia"
    container_access_type = "private"
  }
  CentralStgCont2 = {
    container_name        = "gurugramcont"
    resource_group_name   = "Gurugram"
    storage_account_name  = "sagurugramstg55"
    location              = "CentralIndia"
    container_access_type = "private"
  }
}

IndiaSubnet = {
  subnet1 = {
    subnet_name          = "snet1"
    location             = "CentralIndia"
    resource_group_name  = "Noida"
    virtual_network_name = "noidavnet"
    address_prefixes     = ["10.0.0.0/24"]
  }
  subnet2 = {
    subnet_name          = "snet2"
    location             = "CentralIndia"
    resource_group_name  = "Gurugram"
    virtual_network_name = "gurugramvnet"
    address_prefixes     = ["10.1.0.0/24"]
  }
}

centralvnet = {
  VNET1 = {
    name                = "noidavnet"
    address_space       = ["10.0.0.0/16"]
    resource_group_name = "Noida"
    location            = "CentralIndia"
  }
  VNET2 = {
    name                = "gurugramvnet"
    address_space       = ["10.1.0.0/16"]
    resource_group_name = "Gurugram"
    location            = "CentralIndia"
  }
}

indianVMs = {
  VM1 = {
    vm_name               = "noidavm"
    resource_group_name   = "Noida"
    location              = "CentralIndia"
    admin_username        = "noidauser"
    admin_password        = "Password@123"
    vm_size               = "Standard_D2s_v3"
    nic_name              = "noidanic"
    ip_configuration_name = "ipconfig1"
    subnet_name           = "snet1"
    virtual_network_name  = "noidavnet"
    public_ip_name        = "noida-pip"
  }
  VM2 = {
    vm_name               = "gurugramvm"
    resource_group_name   = "Gurugram"
    location              = "CentralIndia"
    admin_username        = "gurugramuser"
    admin_password        = "Password@123"
    vm_size               = "Standard_D2s_v3"
    nic_name              = "gurugramnic"
    ip_configuration_name = "ipconfig1"
    subnet_name           = "snet2"
    virtual_network_name  = "gurugramvnet"
    public_ip_name        = "gurugram-pip"
  }
}

public_ips = {
  pip1 = {
    public_ips_name     = "noida-pip"
    resource_group_name = "Noida"
    location            = "Central India"
    allocation_method   = "Static"
  }
  pip2 = {
    public_ips_name     = "gurugram-pip"
    resource_group_name = "Gurugram"
    location            = "Central India"
    allocation_method   = "Static"
  }
}

sql_server = {
  mysql_server1 = {
    sql_server_name              = "sqlservernoida"
    resource_group_name          = "Noida"
    location                     = "Central India"
    administrator_login          = "sqlarjun"
    administrator_login_password = "StrongPassword@123"
    version                      = "12.0"
  }

  mysql_server2 = {
    sql_server_name              = "sqlservergurugram"
    resource_group_name          = "Gurugram"
    location                     = "Central India"
    administrator_login          = "sqlarjunpal"
    administrator_login_password = "StrongPassword@123"
    version                      = "12.0"
  }
}

sql_database = {
  sql_db1 = {
    sql_database_name   = "noidasqldb"
    resource_group_name = "Noida"
    max_size_gb         = "5"
    sku_name            = "S0"
    sql_server_name     = "sqlservernoida"
  }
  sql_db2 = {
    sql_database_name   = "gurugramsqldb"
    resource_group_name = "Gurugram"
    max_size_gb         = "5"
    sku_name            = "S0"
    sql_server_name     = "sqlservergurugram"
  }
}

IndianKeyVaults = {
  kv = {
    name           = "keyvault"
    admin_username = "kv_username"
    admin_password = "kv_password@123"
  }
}


