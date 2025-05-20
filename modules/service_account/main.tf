# ---- modules/service_account/main.tf ----
resource "google_service_account" "sa" {
  account_id   = var.sa_name
  display_name = "GitHub Actions Service Account"
  project      = var.project_id
}

resource "google_project_iam_member" "storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.sa.email}"
}

resource "google_project_iam_member" "vertex_admin" {
  project = var.project_id
  role    = "roles/aiplatform.admin"
  member  = "serviceAccount:${google_service_account.sa.email}"
}

resource "google_service_account_key" "sa_key" {
  service_account_id = google_service_account.sa.name
  keepers = {
    last_rotation = timestamp()
  }
  private_key_type = "TYPE_GOOGLE_CREDENTIALS_FILE"
}
resource "local_file" "sa_key_json" {
  content         = google_service_account_key.sa_key.private_key
  filename        = "${path.module}/sa_key.json"
  file_permission = "0600"
  depends_on      = [google_service_account_key.sa_key]
}