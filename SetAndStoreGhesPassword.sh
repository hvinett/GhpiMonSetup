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
    --ghesAdminPassword)  
        ghesAdminPassword=$2
        shift
        shift
        echo "ghesAdminPassword: $ghesAdminPassword"
        ;;
     *)
        echo "Invalid parameter: $1"
        exit 1
        ;;
    esac
done
az login --identity --username $vmManagedUserId
az keyvault secret set --vault-name $keyVault --name "GhesAdminPassword" --value "$ghesAdminPassword"
