# ---- modules/storage_bucket/outputs.tf ----
output "bucket_name" {
  value = google_storage_bucket.mlops_bucket.name
}