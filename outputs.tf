output "acg_ids" {
  description = "ACG IDs"
  value       = { for k, v in ncloud_access_control_group.this : k => v.id }
}
