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
-   (オプション) Terraform Cloud での状態管理に興味のあるチーム

[アーキテクチャ図と以下のセクションは英語版と同じため省略]

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
