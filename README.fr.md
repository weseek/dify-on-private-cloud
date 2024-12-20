# dify-on-private-cloud

[日本語](README.ja.md) | [English](README.md) | [简体中文](README.zh-cn.md) | [Français](README.fr.md)

Un projet pour déployer une plateforme Dify privée sur votre infrastructure cloud en utilisant Infrastructure as Code.

## Aperçu

Ce projet fournit des solutions Infrastructure as Code pour déployer Dify dans un environnement cloud privé, avec une gestion sécurisée optionnelle des états via Terraform Cloud.

### Fonctionnalités Principales
- Configuration automatisée de la plateforme Dify sur les plateformes cloud
- Infrastructure as Code utilisant Terraform
  - (Optionnel) Gestion sécurisée des états avec Terraform Cloud
- Conçu pour une utilisation organisationnelle
- Architecture indépendante de la plateforme
- Authentification sécurisée utilisant Workload Identity Federation (pas d'informations d'identification statiques)

## Utilisateurs Cibles

- Administrateurs d'infrastructure
- Organisations cherchant des solutions IaC pour le déploiement de Dify
- Équipes utilisant Terraform
- Équipes intéressées par la gestion des états via Terraform Cloud (optionnel)

## Architecture

Pour les détails de l'architecture, veuillez consulter la [section Architecture de la version anglaise](README.md#architecture).

## Structure du Projet

Ce dépôt contient les composants suivants :

1. [Configuration Terraform pour Google Cloud](./dify-google-cloud-terraform/README.md)
   - Implémentation IaC pour Dify sur Google Cloud
   - Implémentation de référence actuelle
   - Instructions détaillées de déploiement
   - Directives de configuration

2. [Configuration des Identifiants Dynamiques Terraform](./terraform-dynamic-credentials-setup/README.md)
   - Intégration optionnelle avec Terraform Cloud
   - Gestion sécurisée des identifiants
   - Automatisation de la gestion des états

## Guide de Démarrage Rapide

### Méthode 1 : Sans Terraform Cloud

1. Clonez ce dépôt et effectuez la configuration initiale :
   ```bash
   # Initialisation et connexion à gcloud
   gcloud init --no-launch-browser
   gcloud auth application-default login
   
   # Créer un bucket GCS pour la gestion d'état
   gsutil mb gs://your-tfstate-bucket
   ```

2. Spécifiez le bucket de gestion d'état dans `dify-google-cloud-terraform/terraform/environments/dev/provider.tf` :
   ```hcl
   backend "gcs" {
     bucket = "your-tfstate-bucket" # Remplacez par votre nom de bucket
     prefix = "dify"
   }
   ```

3. Modifiez les valeurs de configuration requises dans `dify-google-cloud-terraform/terraform/environments/dev/terraform.tfvars`

4. Suivez les étapes 2 à 6 du [Guide de Démarrage](./dify-google-cloud-terraform/README.md#getting-started) de dify-google-cloud-terraform

### Méthode 2 : Avec Terraform Cloud

1. Prérequis
   - Créer un projet Google Cloud
   - Créer une Organisation, un Projet et un Workspace dans Terraform Cloud

2. Clonez ce dépôt et modifiez les fichiers de configuration
   ```bash
   # Configuration pour le déploiement Dify
   # Changez uniquement le `project_id`
   vim dify-google-cloud-terraform/terraform/environments/dev/terraform.tfvars
   
   # Configuration pour l'authentification Terraform Cloud
   vim terraform-dynamic-credentials-setup/gcp/terraform.tfvars
   ```

3. Committez les changements et poussez vers le dépôt

4. Configurez le Workspace dans Terraform Cloud
   - Sélectionnez Version Control Workflow
   - Connectez-vous au VCS et spécifiez le dépôt cloné
   - Définissez le Working Directory à `dify-google-cloud-terraform/terraform/environments/dev`

5. Clonez le dépôt dans Google Cloud Shell et configurez l'authentification
   ```bash
   git clone <url-de-votre-dépôt>
   cd <nom-du-dépôt>/terraform-dynamic-credentials-setup
   
   # Connexion à Terraform Cloud
   terraform login
   
   # Configuration de Workload Identity Federation
   cd gcp
   terraform plan
   terraform apply
   ```

6. Exécutez Run dans Terraform Cloud
   - Confirmez que le Plan s'exécute automatiquement
   - Approuvez l'Apply

Pour des instructions détaillées, consultez [terraform-dynamic-credentials-setup](./terraform-dynamic-credentials-setup/README.md).

## Plateformes Supportées

Actuellement implémenté :
- Google Cloud Platform

Support prévu pour :
- Azure
- AWS
- Autres fournisseurs cloud majeurs

## Contribution

Les contributions pour ajouter le support de plateformes cloud supplémentaires sont les bienvenues. Veuillez suivre les modèles d'implémentation existants et les normes de documentation.

## Remerciements

Ce projet intègre du code des projets open-source suivants :

- [dify-google-cloud-terraform](https://github.com/DeNA/dify-google-cloud-terraform) par DeNA (Licence MIT)
  - Fournit l'implémentation de base pour le déploiement sur Google Cloud
  - Situé dans `./dify-google-cloud-terraform/`

- [terraform-dynamic-credentials-setup-examples](https://github.com/hashicorp/terraform-dynamic-credentials-setup-examples) par HashiCorp (Licence MPL-2.0)
  - Fournit l'implémentation pour la gestion sécurisée des identifiants
  - Situé dans `./terraform-dynamic-credentials-setup/`

## Licence

Ce projet est sous licence MIT - voir le fichier [LICENSE](LICENSE) pour plus de détails.

