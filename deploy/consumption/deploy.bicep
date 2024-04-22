param prefix string = 'logappvis'
param location string = resourceGroup().location
param azureOpenAIEndpoint string
@secure()
param azureOpenAIKey string
param azureOpenAIVisionDeployment string
param tags object = {}

var uniqueSuffix = uniqueString(resourceGroup().id, location, prefix)
var uniqueNameFormat = '${prefix}-{0}-${uniqueSuffix}'

resource logicApp 'Microsoft.Logic/workflows@2019-05-01' = {
  name: format(uniqueNameFormat, 'workflow')
  location: location
  tags: tags
  properties: {
    definition: loadJsonContent('../../workflows/consumption/vision.json', '$.definition')
    parameters: {
      azureOpenAIEndpoint: {
        value: azureOpenAIEndpoint
      }
      azureOpenAIKey: {
        value: azureOpenAIKey
      }
      azureOpenAIVisionDeployment: {
        value: azureOpenAIVisionDeployment
      }
      '$connections': {
        value: {}
      }
    }
  }
}
