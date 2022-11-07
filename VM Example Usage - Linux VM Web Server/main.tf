
module "rg" {
  source  = "popravak/rg/azurerm"
  version = "1.0.2"
  //rg_name = "rgspo001"
}

module "vnet" {
  source             = "popravak/vnet/azurerm"
  version            = "1.0.3"
  rg_name            = module.rg.rg_name
  vnet_address_space = ["10.0.0.0/16", "192.168.0.0/16"]
  subnets = {
    "front"   = { subnet = ["10.0.0.0/24"] },
    "mid"     = { subnet = ["10.0.1.0/24"] },
    "back"    = { subnet = ["10.0.2.0/24"] },
    "bastion" = { subnet = ["192.168.0.0/24"] }
  }
  tags = {
    "unit"  = "IT",
    "env"   = "dev",
    "owner" = "Sasa Popravak"
  }
}

module "linuxvm-webserver" {
  source  = "popravak/linuxvm-webserver/azurerm"
  version = "1.0.5"
  vmcount = 2
}



