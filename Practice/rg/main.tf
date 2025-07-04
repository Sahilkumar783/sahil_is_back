resource "azurerm_resource_group" "rgname" {
    for_each = var.rg_name
  name     = each.value.name
  location = each.value.location
}