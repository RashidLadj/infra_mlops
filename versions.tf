# ==============================
# Root of the Terraform Project
# ==============================

# ---- versions.tf ----
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.50.0"
    }
  }
}

# ---- provider config ----
provider "google" {
  project = var.project_id
  region  = var.region
}