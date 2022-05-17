REGION_NAME=eastus
RESOURCE_GROUP=iacdevsquad-$RANDOM
SUBNET_NAME=aks-subnet
VNET_NAME=aks-vnet
AKS_CLUSTER_NAME=aksworkshop-$RANDOM
ACR_NAME=oaacr$RANDOM

az login --service-principal -u $1 -p $2 --tenant $3

az group create --name $RESOURCE_GROUP --location $REGION_NAME

az acr create --resource-group $RESOURCE_GROUP --location $REGION_NAME --name $ACR_NAME --sku Basic

az network vnet create --resource-group $RESOURCE_GROUP --location $REGION_NAME --name $VNET_NAME --address-prefixes 10.0.0.0/8 --subnet-name $SUBNET_NAME --subnet-prefixes 10.240.0.0/16

SUBNET_ID=$(az network vnet subnet show --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --name $SUBNET_NAME --query id -o tsv)

VERSION=$(az aks get-versions --location $REGION_NAME --query 'orchestrators[?!isPreview] | [-1].orchestratorVersion' --output tsv)

az aks create --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME --vm-set-type VirtualMachineScaleSets --node-count 1 --load-balancer-sku standard --location $REGION_NAME --kubernetes-version $VERSION --network-plugin azure --vnet-subnet-id $SUBNET_ID --service-cidr 10.2.0.0/24 --dns-service-ip 10.2.0.10 --docker-bridge-address 172.17.0.1/16 --generate-ssh-keys --zones 3 --attach-acr $ACR_NAME --enable-managed-identity --enable-addons monitoring --yes
