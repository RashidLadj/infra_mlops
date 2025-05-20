# ---- modules/service_account/outputs.tf ----
output "email" {
  value = google_service_account.sa.email
}

# output "private_key" {
#   sensitive = true
#   value     = google_service_account_key.sa_key.private_key
# }


