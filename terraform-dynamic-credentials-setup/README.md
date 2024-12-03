# Terraform Dynamic Credentials Setup

## 参考
https://zenn.dev/google_cloud_jp/articles/e14caa5589f67e

## 準備

### Google Cloud

```bash
gcloud init --no-launch-browser
gcloud auth application-default login
```


### Terraform Cloud

```bash
terraform login
```

## Run

```bash
cd gcp
terraform plan
terraform apply
```
