#!/usr/bin/env bash
set -e

# Assumes az login and storage account/container exist
RG="poc-rg"
STORAGE_ACCOUNT="pocstatestorage"
BUCKET="velero-backups"
LOCATION="eastus"

# Create container for Velero backups
az storage container create --name $BUCKET --account-name $STORAGE_ACCOUNT

# Create credentials file for Velero (example)
cat > credentials-velero <<EOF
[default]
azure_storage_account_id = /subscriptions/7908ea24-a708-4291-be15-98426e3e9ca5/resourceGroups/$RG/providers/Microsoft.Storage/storageAccounts/$STORAGE_ACCOUNT
azure_storage_account_key = $(az storage account keys list --resource-group $RG --account-name $STORAGE_ACCOUNT --query "[0].value" -o tsv)
EOF

# Install Velero (example using velero CLI)
velero install \
  --provider azure \
  --plugins velero/velero-plugin-for-microsoft-azure:v1.6.0 \
  --bucket $BUCKET \
  --secret-file ./credentials-velero \
  --backup-location-config resourceGroup=$RG,storageAccount=$STORAGE_ACCOUNT

echo "Velero install initiated. Verify velero pods in velero namespace."
