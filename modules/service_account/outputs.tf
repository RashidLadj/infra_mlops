# ---- modules/service_account/outputs.tf ----
output "email" {
  value = google_service_account.sa.email
}
