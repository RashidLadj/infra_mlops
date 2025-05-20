# ---- outputs.tf ----
output "bucket_name" {
  value = module.storage.bucket_name
}

output "service_account_email" {
  value = module.service_account.email
}

# output "service_account_private_key" {
#   sensitive = true
#   value     = module.service_account.private_key
# }

output "vertex_ai_endpoint_id" {
  value = module.vertex_ai.endpoint_id
}
