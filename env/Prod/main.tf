module "resourcegroup" {
  source  = "../../Rg"
  rg_name = var.rg_name
}

module "virtualnetwork" {
  source     = "../../vnet"
  vn_name    = var.vn_name
  depends_on = [module.resourcegroup]
}

module "subnet" {
  source     = "../../subnet"
  sn_name    = var.sn_name
  depends_on = [module.virtualnetwork]
}

module "publicip" {
  source     = "../../publicip"
  pip_name   = var.pip_name
  depends_on = [module.resourcegroup]
}

module "networkinterface" {
  source     = "../../NIC"
  nic_name   = var.nic_name
  depends_on = [module.publicip, module.subnet]
}

module "virtualmachine" {
  source     = "../../vm"
  vm_name    = var.vm_name
  depends_on = [module.networkinterface, module.subnet]
}

module "sqlsrvrname" {
  source     = "../../sqlserver"
  srvr_name  = var.srvr_name
  depends_on = [module.resourcegroup]
}

module "sqldatabase" {
  source        = "../../sqldatabase"
  database_name = var.database_name
  depends_on    = [module.sqlsrvrname]

}

module "networksecuritygroup" {
  source     = "../../nsg"
  nsg_name   = var.nsg_name
  depends_on = [module.resourcegroup]
}

module "networkinterfacesecuritygroupassociation" {
  source     = "../../networkinterfacesecuirtygroupassociation"
  nisga_name = var.nisga_name
  depends_on = [module.virtualmachine, module.networksecuritygroup]
}


module "loadbalancer" {
  source     = "../../loadbalancer"
  lb_name    = var.lb_name
  depends_on = [module.publicip, module.virtualmachine]
}
