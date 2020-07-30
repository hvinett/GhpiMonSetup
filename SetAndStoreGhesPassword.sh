#!/bin/bash
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"
    case "$key" in
    --keyVault)  
        keyVault=$2
        shift
        shift
        echo "keyVault: $keyVault"
        ;;
    --vmManagedUserId)  
        vmManagedUserId=$2
        shift
        shift
        echo "vmManagedUserId: $vmManagedUserId"
        ;;
     *)
        echo "Invalid parameter: $1"
        exit 1
        ;;
    esac
done
GhesAdminPassword=$(openssl rand -base64 32)
az login --identity --username $vmManagedUserId
az keyvault secret set --vault-name $keyVault --name "GhesAdminPassword" --value "$GhesAdminPassword"
