resource "google_storage_bucket" "mlops_bucket" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = true
}