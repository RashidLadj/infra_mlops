# Terraform Infrastructure for MLOps Project on GCP

Ce dépôt contient les configurations Terraform pour provisionner l'infrastructure Google Cloud nécessaire à un projet MLOps simple.

---

## Contenu du projet

- **Modules :**  
  - `storage_bucket` : Création d'un bucket Google Cloud Storage  
  - `service_account` : Création d'un compte de service GCP avec les rôles nécessaires  
  - `vertex_ai` : Création d'un endpoint Vertex AI pour le déploiement du modèle  

- **Fichiers principaux :**  
  - `main.tf` : Point d'entrée principal qui instancie les modules  
  - `variables.tf` : Définitions des variables d'entrée  
  - `outputs.tf` : Sorties Terraform (ex : noms de bucket, emails de comptes de service)  
  - `terraform.tfvars` : Variables spécifiques à ton environnement (non versionné, à créer localement)

---

## Prérequis

- Un projet GCP avec facturation activée  
- Compte Google Cloud configuré localement (via `gcloud auth application-default login`)  
- Terraform installé (version >= 1.3.0)  

---

## Variables à configurer

Crée un fichier `terraform.tfvars` à la racine du projet avec les valeurs adaptées à ton projet :

```hcl
project_id             = "ton-id-projet-gcp"
region                 = "europe-west1"
bucket_name            = "mlops-bucket-unique"
sa_name                = "github-actions-sa"
endpoint_name          = "mlops-endpoint"
endpoint_display_name  = "MLOps Model Endpoint"
```

---

## Utilisation
1. Initialiser terraform
    ```hcl
    terraform init
    ```

2. Vérifier le plan d'exécution :
    ```hcl
    terraform plan
    ```

3. Appliquer la configuration :
    ```hcl
    terraform apply
    ```

---

## Après le déploiement

- Récupérer la clé du compte de service générée (voir outputs Terraform)
- Ajouter la clé comme secret dans GitHub (GCP_SERVICE_ACCOUNT_KEY) pour la CI/CD
- Utiliser cette infra pour déployer des modèles ML, lancer des workflows Airflow, ou déployer sur GKE


---

## Structure du projet
```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars (à créer localement, non versionné)
└── modules
    ├── storage_bucket
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── service_account
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── vertex_ai
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## Contact
Pour toute question, n'hésite pas à me contacter.
