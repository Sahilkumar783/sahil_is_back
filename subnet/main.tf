resource "azurerm_subnet" "SNList" {
    for_each = var.sn_name
  name                 = each.value.snname
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}
