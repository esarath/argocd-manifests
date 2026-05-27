# poc-azure-aks-cicd-gitops

## Overview
Production-grade POC: AKS + CI/CD + GitOps + Monitoring + Velero backups.

## Prereqs
- Azure CLI (az)
- Terraform
- Docker
- kubectl
- Velero CLI (for local testing)

## Quick start
1. Open PowerShell or Cloud Shell.
2. cd C:\Users\tiny-win\Downloads\poc-azure-aks-cicd-gitops
3. ./setup-backend.sh
4. terraform init
5. terraform apply
6. Build & push image: ./build-and-push.sh
7. kubectl apply -f apps\manifests\webapp-deployment.yaml
8. kubectl apply -f apps\manifests\postgres-deployment.yaml
9. Verify: kubectl get pods -A

## DockerHub
Images pushed to: docker.io/esarathmails

## Velero
Velero backups stored in Azure Blob Storage. Use velero-install.sh to install Velero in-cluster.

## Notes
- Use Azure Cloud Shell for consistent environment.
- Test Velero restores regularly.
