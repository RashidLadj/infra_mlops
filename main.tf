/*
==================================================
Terraform GCP - Configuration pour MLOps de base
==================================================

Ce fichier Terraform installe les ressources fondamentales
nécessaires à un projet MLOps sur Google Cloud Platform (GCP).

🔧 Ce qu’il fait :
-------------------
1. ✅ Configure le provider GCP avec le bon projet et la bonne région.
2. ✅ Active toutes les APIs nécessaires pour Vertex AI, GCS, GKE, etc.
3. ✅ Crée un bucket Google Cloud Storage pour stocker les modèles ML.
4. ✅ Crée un compte de service pour GitHub Actions ou CI/CD.
5. ✅ Associe les bons rôles IAM à ce compte (accès GCS + Vertex AI).

📌 APIs activées :
-------------------
- Cloud Storage
- Vertex AI
- Artifact Registry
- Kubernetes Engine
- Cloud Build
- IAM API

📁 Ressources créées :
-----------------------
- `google_storage_bucket`: Bucket GCS pour stocker les modèles `.joblib`
- `google_service_account`: Compte de service CI/CD (ex: GitHub Actions)
- `google_project_iam_member`: Rôles IAM (storage.admin, aiplatform.admin)

🎯 Usage :
-----------
1. Assurez-vous que le projet GCP est bien créé manuellement.
2. Lancez :
   terraform init
   terraform apply

📌 Prérequis :
---------------
- GCP Project actif
- Identifiants configurés via `gcloud auth application-default login`
- Terraform CLI ≥ 1.0

Auteur : [Ton Nom]
Date : [Aujourd'hui]
Projet : MLOps End-to-End sur GCP

==================================================
*/

# ---- main.tf ----
module "storage" {
  source      = "./modules/storage_bucket"
  bucket_name = var.bucket_name
  location    = var.region
}

module "service_account" {
  source      = "./modules/service_account"
  sa_name     = var.sa_name
  project_id  = var.project_id
}

module "vertex_ai" {
  source                = "./modules/vertex_ai"
  endpoint_name         = var.endpoint_name
  endpoint_display_name = var.endpoint_display_name
  location              = var.region
}


# provider "google" {
#   project = var.project
#   region  = var.region
# }
# resource "google_project_service" "required_services" {
#   for_each = toset([
#     "storage.googleapis.com",
#     "aiplatform.googleapis.com",
#     "artifactregistry.googleapis.com",
#     "container.googleapis.com",
#     "cloudbuild.googleapis.com",
#     "iam.googleapis.com"
#   ])
#   service = each.value
#   project = var.project

# }

# resource "google_storage_bucket" "model_bucket" {
#   name     = var.bucket_name
#   location = "EU"
# }

# resource "google_service_account" "github_actions" {
#   account_id   = "github-actions-sa"
#   display_name = "GitHub Actions Service Account"
# # project      = var.project
# }



# resource "google_project_iam_member" "sa_storage_admin" {
#   project = var.project
#   role   = "roles/storage.admin"
#   member = "serviceAccount:${google_service_account.github_actions.email}"
# }

# resource "google_project_iam_member" "sa_vertex_admin" {
#     project = var.project
#     role   = "roles/aiplatform.admin"
#     member = "serviceAccount:${google_service_account.github_actions.email}"
# }
