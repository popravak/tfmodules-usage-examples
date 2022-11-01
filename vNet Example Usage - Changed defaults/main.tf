
module "rg" {
  source  = "popravak/rg/azurerm"
  version = "1.0.1"
  rg_name = "rgnondefault001"
}

module "vnet" {
  source  = "popravak/vnet/azurerm"
  version = "1.0.0"
  business_unit_prefix = "hr"
  environment_prefix   = "prod"
  rg_name = module.rg.rg_name
  location              = "northeurope"
  vnet_address_space    = ["10.0.0.0/16", "192.168.0.0/16"]
  subnets = { 
    "front"   = { subnet = ["10.0.0.0/24"] },
    "mid"     = { subnet = ["10.0.1.0/24"] },
    "back"    = { subnet = ["10.0.2.0/24"] },
    "bastion" = { subnet = ["192.168.0.0/24"] } 
  }
  tags = { 
    "unit" = "hr",
    "env"   = "prod",
    "owner" = "Sasa Popravak"
  }
}

