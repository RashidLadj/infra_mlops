output "endpoint_id" {
  description = "ID de l'endpoint créé"
  value       = google_vertex_ai_endpoint.ml_endpoint.id
}
