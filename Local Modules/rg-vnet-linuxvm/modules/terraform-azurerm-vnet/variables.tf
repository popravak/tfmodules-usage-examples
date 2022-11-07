

variable "rg_name" {
  description = "Resource group name"
  type        = string
  default     = "rgspo001"
}

variable "location" {
  description = "Resource group location"
  type        = string
  default     = "North Europe"
}

variable "vnet_address_space" {
  description = "List of vNet prefixes"
  type        = list(string)
  default     = ["172.16.0.0/12"]
}

variable "subnets" {
  description = "Names and address prefixes of subnets"
  type        = map(any)
  default = {
    "front" = { subnet = ["172.16.1.0/24"] },
    "mid"   = { subnet = ["172.16.2.0/24"] },
    "back"  = { subnet = ["172.16.3.0/24"] }
  }
}

variable "business_unit_prefix" {
  description = "Business unit prefix"
  type        = string
  default     = "IT"
}

variable "environment_prefix" {
  description = "Environment prefix"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "vNet tags"
  type        = map(string)
  default = {
    "unit" = "it"
    "env"  = "dev"
    owner  = "Sasa Popravak"
  }
}

