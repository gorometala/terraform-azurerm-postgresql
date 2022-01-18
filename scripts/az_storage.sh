#!/bin/bash

RESOURCE_GROUP_NAME=terraform
#STORAGE_ACCOUNT_NAME=tfstate$RANDOM
STORAGE_ACCOUNT_NAME=terraform1209
CONTAINER_NAME=terraform

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location westeurope

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
