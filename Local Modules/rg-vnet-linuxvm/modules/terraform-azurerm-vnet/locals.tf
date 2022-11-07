locals {
  vnet_name = "${var.business_unit_prefix}-${var.environment_prefix}-vnet-${random_string.random.result}"
  subnets   = var.subnets
}
