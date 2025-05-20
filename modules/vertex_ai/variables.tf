variable "endpoint_name" {
  description = "Nom unique (ID) de l'endpoint Vertex AI"
  type        = string
}

variable "endpoint_display_name" {
  description = "Nom lisible de l'endpoint"
  type        = string
}

variable "location" {
  description = "Location (zone) pour Vertex AI (ex: europe-west1)"
  type        = string
}