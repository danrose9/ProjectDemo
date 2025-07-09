param keyVaultName string
param secretName string
@secure()
param secretValue string

resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' existing = {
  name: keyVaultName
}

resource secret 'Microsoft.KeyVault/vaults/secrets@2024-12-01-preview' = {
  name: secretName
  parent: keyVault
  properties: {
    value: secretValue
    attributes: {
      enabled: true
    }
  }
}
