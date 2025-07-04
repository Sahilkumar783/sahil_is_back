data "azurerm_network_interface" "NIList" {
    for_each = var.nisga_name
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_security_group" "NSGList" {
    for_each = var.nisga_name
  name                = each.value.nsgname
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_network_interface_security_group_association" "NISGAList" {
    for_each = var.nisga_name
  network_interface_id      = data.azurerm_network_interface.NIList[each.key].id
  network_security_group_id = data.azurerm_network_security_group.NSGList[each.key].id
}