variable "rg_name" {
  description = "Resource group name"
  type        = string
  default     = "rgspo001"
}

variable "rg_location" {
  description = "Resource group location"
  type        = string
  default     = "North Europe"
}

variable "tags" {
  description = "Resource group tags"
  type        = map(string)
  default = {
    "project" = "Terraform"
    "unit"    = "IT"
    "owner"   = "Sasa Popravak"
  }
}
