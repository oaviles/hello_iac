param mylocation string = resourceGroup().location
param mystorageAccountName string = 'Your Unique Storage Name' // must be globally unique
param myWebAppName string = 'oa-${uniqueString(resourceGroup().id)}' // must be globally unique
param sku string = 'F1'

var myServicePlanName = 'ASP-${myWebAppName}'

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: mystorageAccountName
  location: mylocation
  kind: 'Storage'
  sku: {
    name: 'Standard_LRS'
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: myServicePlanName
  location: mylocation
  sku: {
    name: sku
    capacity: 1
  }
}


resource webApplication 'Microsoft.Web/sites@2018-11-01' = {
  name: myWebAppName
  location: mylocation
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
  }
}
