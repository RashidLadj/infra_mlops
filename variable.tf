# ---- variables.tf ----
variable "project_id" {
  description = "ID of the GCP project"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-west1"
}

variable "bucket_name" {
  description = "Name of the storage bucket"
  type        = string
}

variable "sa_name" {
  description = "Name of the GitHub Actions service account"
  type        = string
  default     = "github-actions-sa"
}

variable "endpoint_name" {
  description = "Nom technique (unique) de l'endpoint Vertex"
  type        = string
  default     = "mlops-endpoint"  # ou sans default, à définir dans tfvars
}


variable "endpoint_display_name" {
  description = "Nom de l'endpoint Vertex AI"
  type        = string
  default     = "mlops-model-endpoint"
}
