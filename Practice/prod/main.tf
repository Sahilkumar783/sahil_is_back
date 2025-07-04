module "resourcegroup" {
  source = "../rg"
  rg_name = var.rg_name
}

module "saname" {
  source = "../storageaccount"
  sa_name = var.sa_name
  depends_on = [ module.resourcegroup ]
}