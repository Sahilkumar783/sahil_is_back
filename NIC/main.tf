data "azurerm_subnet" "SNList" {
  for_each = var.nic_name
  name                 = each.value.snname
  virtual_network_name = "vn51"
  resource_group_name  = "SahilRG51"
}

data "azurerm_public_ip" "PIPList" {
  for_each = var.nic_name
  name                = each.value.pipname
  resource_group_name = "SahilRG51"
}

resource "azurerm_network_interface" "NIList" {
    for_each = var.nic_name
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.SNList[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.PIPList[each.key].id
  }
}
