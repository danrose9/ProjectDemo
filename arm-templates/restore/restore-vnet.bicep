param virtualNetworks_vnet_projectdemo_dev_name string = 'vnet-projectdemo-dev'

resource virtualNetworks_vnet_projectdemo_dev_name_resource 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  location: 'eastus'
  name: virtualNetworks_vnet_projectdemo_dev_name
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    enableDdosProtection: false
    privateEndpointVNetPolicies: 'Disabled'
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: '10.0.0.0/16'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          serviceEndpoints: [
            {
              locations: [
                '*'
              ]
              service: 'Microsoft.Storage.Global'
            }
          ]
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
  }
}
