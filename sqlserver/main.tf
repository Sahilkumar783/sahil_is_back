resource "azurerm_sql_server" "SRVRList" {
    for_each = var.srvr_name
  name                         = each.value.srvrname
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}