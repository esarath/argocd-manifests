#!/usr/bin/env bash
set -e

RG="poc-rg"
LOCATION="eastus"
STORAGE_ACCOUNT="pocstatestorage"
CONTAINER="tfstate"

echo "Creating resource group..."
az group create --name $RG --location $LOCATION

echo "Creating storage account..."
az storage account create \
  --name $STORAGE_ACCOUNT \
  --resource-group $RG \
  --location $LOCATION \
  --sku Standard_LRS \
  --kind StorageV2

echo "Creating blob container..."
az storage container create \
  --name $CONTAINER \
  --account-name $STORAGE_ACCOUNT

echo "Backend setup complete. Next: terraform init"
