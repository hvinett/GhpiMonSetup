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
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
ghesAdminPassword=$(openssl rand -base64 14)
az login --identity --username $vmManagedUserId
az keyvault secret set --vault-name $keyVault --name "GhesAdminPassword" --value "$ghesAdminPassword"
