# dify-on-private-cloud

[日本語](README.ja.md) | [English](README.md) | [简体中文](README.zh-cn.md) | [Français](README.fr.md)

Infrastructure as Code を使用して、プライベートな Dify プラットフォームをクラウドインフラストラクチャに構築できます。

## 概要

このプロジェクトは、プライベートクラウド環境での Dify のデプロイメントのための Infrastructure as Code ソリューションを提供し、オプションで Terraform Cloud による安全な状態管理も可能です。

### 主な機能
- クラウドプラットフォーム上での Dify プラットフォームの自動セットアップ
- Terraform を使用した Infrastructure as Code
  - (オプション) Terraform Cloud による安全な状態管理
- 組織利用向けに設計
- プラットフォームに依存しないアーキテクチャ設計
- Workload Identity Federation による安全な認証（静的な認証情報不要）

## 対象ユーザー

- インフラストラクチャ管理者
- Dify デプロイメントに IaC ソリューションを求める組織
- Terraform を使用するチーム
- Terraform Cloud での状態管理に興味のあるチーム（オプション）

## アーキテクチャ

アーキテクチャの詳細については[英語版のアーキテクチャセクション](README.md#architecture)を参照してください。

## プロジェクト構成

このリポジトリは以下のコンポーネントで構成されています：

1. [Google Cloud Terraform Setup](./dify-google-cloud-terraform/README.md)
   - Google Cloud 上での Dify の IaC 実装
   - 現在のリファレンス実装
   - 詳細なデプロイメント手順
   - 設定ガイドライン

2. [Terraform Dynamic Credentials Setup](./terraform-dynamic-credentials-setup/README.md)
   - オプションの Terraform Cloud 統合
   - 安全な認証情報管理
   - 状態管理の自動化

## 前提条件

各コンポーネントのドキュメントを参照してください：
- [Google Cloud セットアップ要件](./dify-google-cloud-terraform/README.md#prerequisites)
- [Terraform Cloud セットアップ要件](./terraform-dynamic-credentials-setup/README.md#prepare)（オプション）

## クイックスタートガイド

### 方法1: Terraform Cloud を使用しない場合

1. このリポジトリを clone し、以下の初期設定を行います：
   ```bash
   # gcloud の初期化とログイン
   gcloud init --no-launch-browser
   gcloud auth application-default login
   
   # ステート管理用の GCS バケットを作成
   gsutil mb gs://your-tfstate-bucket
   ```

2. `dify-google-cloud-terraform/terraform/environments/dev/provider.tf` でステート管理用バケットを指定します：
   ```hcl
   backend "gcs" {
     bucket = "your-tfstate-bucket" # バケット名を置き換えてください
     prefix = "dify"
   }
   ```

3. `dify-google-cloud-terraform/terraform/environments/dev/terraform.tfvars` で必要な設定値を編集

4. dify-google-cloud-terraform の [Getting Started](./dify-google-cloud-terraform/README.md#getting-started) の手順2から6に従って設定を進めます

### 方法2: Terraform Cloud を使用する場合

1. 事前準備
   - Google Cloud Project を作成
   - Terraform Cloud で Organization、Project、Workspace を作成

2. このリポジトリを clone し、以下の設定ファイルを編集
   ```bash
   # Dify デプロイメント用の設定
   vim dify-google-cloud-terraform/terraform/environments/dev/terraform.tfvars
   
   # Terraform Cloud 認証用の設定
   vim terraform-dynamic-credentials-setup/gcp/terraform.tfvars
   ```

3. 変更を commit し、リポジトリに push

4. Terraform Cloud で Workspace を設定
   - Version Control Workflow を選択
   - Connect to VCS で clone したリポジトリを指定
   - Working Directory を `dify-google-cloud-terraform/terraform/environments/dev` に設定

5. Google Cloud Shell でリポジトリを clone し、認証設定を実行
   ```bash
   git clone <your-repository-url>
   cd <repository-name>/terraform-dynamic-credentials-setup
   
   # Terraform Cloud に接続
   terraform login
   
   # Workload Identity Federation を設定
   cd gcp
   terraform plan
   terraform apply
   ```

6. Terraform Cloud で Run を実行
   - 自動的に Plan が実行されることを確認
   - Apply を承認

詳細な設定手順については、[terraform-dynamic-credentials-setup](./terraform-dynamic-credentials-setup/README.md) を参照してください。

## サポートプラットフォーム

現在実装済み：
- Google Cloud Platform

今後のサポート予定：
- Azure
- AWS
- その他主要クラウドプロバイダー

## コントリビューション

追加のクラウドプラットフォームのサポートに関するコントリビューションを歓迎します。既存の実装パターンとドキュメント基準に従ってください。

## 謝辞

このプロジェクトは以下のオープンソースプロジェクトのコードを利用しています：

- [dify-google-cloud-terraform](https://github.com/DeNA/dify-google-cloud-terraform) by DeNA (MIT License)
  - Google Cloud デプロイメントの基本実装を提供
  - `./dify-google-cloud-terraform/` に配置

- [terraform-dynamic-credentials-setup-examples](https://github.com/hashicorp/terraform-dynamic-credentials-setup-examples) by HashiCorp (MPL-2.0 License)
  - 安全な認証情報管理の実装を提供
  - `./terraform-dynamic-credentials-setup/` に配置

## ライセンス

このプロジェクトは MIT ライセンスの下で提供されています - 詳細は [LICENSE](LICENSE) ファイルを参照してください。
