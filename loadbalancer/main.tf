data "azurerm_public_ip" "PIPList" {
    for_each = var.lb_name
  name                = each.value.pipname
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_lb" "LBList" {
    for_each = var.lb_name
  name                = each.value.lbname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.PIPList[each.key].id
  }
}