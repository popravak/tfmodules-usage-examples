module "rg" {
  source  = "./modules/terraform-azurerm-rg"
  rg_name = var.rg_name
}

module "vnet" {
  depends_on = [
    module.rg
  ]
  source  = "./modules/terraform-azurerm-vnet"
  rg_name = var.rg_name
}

module "linuxvm" {
  depends_on = [
    module.vnet
  ]
  source     = "./modules/terraform-azurerm-linuxvm-webserver"
  subnet_ids = module.vnet.subnet_ids
  rg_name    = var.rg_name
  vmcount = 2
}

