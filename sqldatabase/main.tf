data "azurerm_mssql_server" "SRVRList" {
    for_each = var.database_name
  name                = each.value.srvrname
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_mssql_database" "SQLDBList" {
    for_each = var.database_name
  name           = each.value.databasename
  server_id      = data.azurerm_mssql_server.SRVRList[each.key].id
}