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


---
---

## Qualité du code et hooks Git avec pre-commit

Pour assurer la qualité et la cohérence du code Terraform, un système de **hooks Git** via [`pre-commit`](https://pre-commit.com) a été mis en place dans ce dépôt.

Avant chaque commit, plusieurs vérifications automatiques sont effectuées :  
- Formatage automatique du code avec `terraform fmt`  
- Validation de la configuration avec `terraform validate`  
- Analyse statique avancée avec `TFLint`

---

### Prérequis pour les développeurs / DevOps collaborateurs

Afin que ces hooks fonctionnent correctement, merci de vous assurer des éléments suivants sur votre environnement local :

- **Terraform** doit être installé (version >= 1.3.0).  
- Un `terraform init` doit avoir été exécuté dans le dossier pour initialiser les providers.  
- **TFLint** doit être installé localement.  

Pour installer TFLint :

- Sur macOS (via Homebrew) :
  ```bash
  brew install tflint
  ```


- Sur Linux, utiliser le script officiel :
  ```bash
  curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
  ```

- Ou consulter la documentation officielle pour d'autres méthodes : https://github.com/terraform-linters/tflint#installation


### Installation des hooks pre-commit
Après avoir cloné le dépôt, installez les hooks avec la commande suivante :
  ```bash
  pre-commit install -v config/pre-commit/.pre-commit-config.yaml
  ```

Si vous ne disposez pas encore de pre-commit, vous pouvez l’installer via pip :
  ```bash
  pip install pre-commit
  ```

Cette configuration aide à prévenir l’introduction d’erreurs dans le code Terraform et garantit une meilleure qualité globale du projet lors des collaborations.