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

## Prérequis

Veuillez consulter la documentation de chaque composant :
- [Exigences de configuration Google Cloud](./dify-google-cloud-terraform/README.md#prerequisites)
- [Exigences de configuration Terraform Cloud](./terraform-dynamic-credentials-setup/README.md#prepare) (Optionnel)

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

