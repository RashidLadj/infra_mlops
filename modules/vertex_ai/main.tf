resource "google_vertex_ai_endpoint" "ml_endpoint" {
  name         = var.endpoint_name           # 👈 Ajouté
  display_name = var.endpoint_display_name
  location     = var.location     # ✅ Correct
  description  = "MLOps endpoint provisionné via Terraform"
}
