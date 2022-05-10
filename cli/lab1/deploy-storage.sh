REGION_NAME=eastus
RESOURCE_GROUP=iaclab2-$RANDOM
STORAGE_NAME=oastorage$RANDOM

az login --service-principal -u $1 -p $2 --tenant $3

az group create --name $RESOURCE_GROUP --location $REGION_NAME

az storage account create -n $STORAGE_NAME -g $RESOURCE_GROUP --kind StorageV2 -l $REGION_NAME