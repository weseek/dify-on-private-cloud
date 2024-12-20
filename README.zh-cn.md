# dify-on-private-cloud

[日本語](README.ja.md) | [English](README.md) | [简体中文](README.zh-cn.md) | [Français](README.fr.md)

一个使用基础架构即代码（Infrastructure as Code）在云基础设施上部署私有 Dify 平台的项目。

## 概述

本项目提供了在私有云环境中部署 Dify 的基础架构即代码解决方案，并可选择使用 Terraform Cloud 进行安全的状态管理。

### 主要特点
- 在云平台上自动部署 Dify 平台
- 使用 Terraform 实现基础架构即代码
  - （可选）通过 Terraform Cloud 进行安全的状态管理
- 为组织使用而设计
- 与平台无关的架构设计
- 使用 Workload Identity Federation 进行安全认证（无需静态凭证）

## 目标用户

- 基础设施管理员
- 寻求 Dify 部署 IaC 解决方案的组织
- 使用 Terraform 的团队
- 对使用 Terraform Cloud 进行状态管理感兴趣的团队（可选）

## 架构

有关架构详细信息，请参阅[英文版架构部分](README.md#architecture)。

## 项目结构

本仓库包含以下组件：

1. [Google Cloud Terraform 配置](./dify-google-cloud-terraform/README.md)
   - 用于 Google Cloud 的 Dify IaC 实现
   - 当前参考实现
   - 详细部署说明
   - 配置指南

2. [Terraform 动态凭证配置](./terraform-dynamic-credentials-setup/README.md)
   - 可选的 Terraform Cloud 集成
   - 安全的凭证管理
   - 状态管理自动化

## 前提条件

请参考各组件文档：
- [Google Cloud 设置要求](./dify-google-cloud-terraform/README.md#prerequisites)
- [Terraform Cloud 设置要求](./terraform-dynamic-credentials-setup/README.md#prepare)（可选）

## 支持的平台

当前已实现：
- Google Cloud Platform

计划支持：
- Azure
- AWS
- 其他主要云服务提供商

## 贡献

欢迎为添加其他云平台支持做出贡献。请遵循现有的实现模式和文档标准。

## 致谢

本项目包含以下开源项目的代码：

- [dify-google-cloud-terraform](https://github.com/DeNA/dify-google-cloud-terraform) by DeNA (MIT 许可证)
  - 提供 Google Cloud 部署的基础实现
  - 位于 `./dify-google-cloud-terraform/`

- [terraform-dynamic-credentials-setup-examples](https://github.com/hashicorp/terraform-dynamic-credentials-setup-examples) by HashiCorp (MPL-2.0 许可证)
  - 提供安全凭证管理的实现
  - 位于 `./terraform-dynamic-credentials-setup/`

## 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件。

