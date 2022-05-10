
az login --service-principal -u $1 -p $2 --tenant $3

az policy definition create --name audit-tag-x-all-services --display-name 'Audit Tags for All Services' --description 'This policy ensures that all azure services use a tag' --rules 'azurepolicy.rules.json' --params 'azurepolicy.patameters.json' --mode All