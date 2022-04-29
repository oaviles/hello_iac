param mylocation string = resourceGroup().location
param mystorageAccountName string = 'Your Unique Storage Name' // must be globally unique

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: mystorageAccountName
  location: mylocation
  kind: 'Storage'
  sku: {
    name: 'Standard_LRS'
  }
}
