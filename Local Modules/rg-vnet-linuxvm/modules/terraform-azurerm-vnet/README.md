# terraform-azurerm-vnet

## The module is for learning purposes.

Note 1
------ 
Resource group should exist before calling to this module.

Note 2 
------
Virtual Network Name is derived from variables:
- business_unit_prefix
- environment_prefix
- constant rg
- random string
i.e. vnet_name = "${var.business_unit_prefix}-${var.environment_prefix}-vnet-${random_string.random.result}"
Example: finance-dev-vnet-tg07AB


Note 3
------
Example arguments for calling the module:

vnet_address_space = ["10.0.0.0/16", "192.168.0.0/16"]
subnets = {
  "front"   = { subnet = ["10.0.0.0/24"] }
  "middle"  = { subnet = ["10.0.1.0/24"] },
  "back"    = { subnet = ["10.0.2.0/24"] }
}

tags = {
      "unit"  = "IT"
      "env"   = "dev"
      "owner" = "Sasa Popravak"
    }

location = "northeurope"
business_unit_prefix = "IT"
environment_prefix = "dev"

