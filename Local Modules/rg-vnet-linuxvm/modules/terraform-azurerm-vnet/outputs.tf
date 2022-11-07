
output "subnet_ids" {
  description = "List of subnets IDs"
  value       = flatten(concat([for s in azurerm_subnet.snet : s.id]))
}
