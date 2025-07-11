param actionGroups_Application_Insights_Smart_Detection_name string = 'Application Insights Smart Detection'
param components_ProjectDemo_AppInsights_name string = 'ProjectDemo-AppInsights'
param mongoClusters_mongo_projectdemo_name string = 'mongo-projectdemo'
param privateDnsZones_privatelink_mongo_cosmos_azure_com_name string = 'privatelink.mongo.cosmos.azure.com'
param privateDnsZones_privatelink_mongocluster_cosmos_azure_com_name string = 'privatelink.mongocluster.cosmos.azure.com'
param serverfarms_ASP_ProjectDemo_ca6e_name string = 'ASP-ProjectDemo-ca6e'
param servers_project_demo_sql_server_name string = 'project-demo-sql-server'
param sites_ProjectDemoApi_name string = 'ProjectDemoApi'
param storageAccounts_projectdemostorage_name string = 'projectdemostorage'
param vaults_projectdemo_dev_name string = 'projectdemo-dev'
param vaults_projectdemo_local_name string = 'projectdemo-local'
param virtualNetworks_vnet_projectdemo_name string = 'vnet-projectdemo'

@secure()
param vulnerabilityAssessments_Default_storageContainerPath string
param workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_externalid string = '/subscriptions/c2a2f372-d73c-426e-985d-aeeb69f56647/resourceGroups/DefaultResourceGroup-EUS/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS'
param workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name string = 'DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS'

resource vaults_projectdemo_dev_name_resource 'Microsoft.KeyVault/vaults@2024-12-01-preview' = {
  location: 'eastus'
  name: vaults_projectdemo_dev_name
  properties: {
    accessPolicies: []
    enableRbacAuthorization: true
    enableSoftDelete: true
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    networkAcls: {
      bypass: 'None'
      defaultAction: 'Allow'
      ipRules: []
      virtualNetworkRules: []
    }
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
    sku: {
      family: 'A'
      name: 'standard'
    }
    softDeleteRetentionInDays: 90
    tenantId: '73bf9c05-bd27-4332-a610-bb1a50300369'
    vaultUri: 'https://${vaults_projectdemo_dev_name}.vault.azure.net/'
  }
}

resource vaults_projectdemo_local_name_resource 'Microsoft.KeyVault/vaults@2024-12-01-preview' = {
  location: 'eastus'
  name: vaults_projectdemo_local_name
  properties: {
    accessPolicies: []
    enableRbacAuthorization: true
    enableSoftDelete: true
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    networkAcls: {
      bypass: 'None'
      defaultAction: 'Allow'
      ipRules: []
      virtualNetworkRules: []
    }
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
    sku: {
      family: 'A'
      name: 'standard'
    }
    softDeleteRetentionInDays: 90
    tenantId: '73bf9c05-bd27-4332-a610-bb1a50300369'
    vaultUri: 'https://${vaults_projectdemo_local_name}.vault.azure.net/'
  }
}

resource vaults_projectdemo_dev_name_jwtAudience 'Microsoft.KeyVault/vaults/secrets@2024-12-01-preview' = {
  parent: vaults_projectdemo_dev_name_resource
  location: 'eastus'
  name: 'jwtAudience'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_projectdemo_local_name_JwtAudience 'Microsoft.KeyVault/vaults/secrets@2024-12-01-preview' = {
  parent: vaults_projectdemo_local_name_resource
  location: 'eastus'
  name: 'JwtAudience'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_projectdemo_dev_name_jwtIssuer 'Microsoft.KeyVault/vaults/secrets@2024-12-01-preview' = {
  parent: vaults_projectdemo_dev_name_resource
  location: 'eastus'
  name: 'jwtIssuer'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_projectdemo_local_name_JwtIssuer 'Microsoft.KeyVault/vaults/secrets@2024-12-01-preview' = {
  parent: vaults_projectdemo_local_name_resource
  location: 'eastus'
  name: 'JwtIssuer'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_projectdemo_dev_name_jwtSigningKey 'Microsoft.KeyVault/vaults/secrets@2024-12-01-preview' = {
  parent: vaults_projectdemo_dev_name_resource
  location: 'eastus'
  name: 'jwtSigningKey'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_projectdemo_local_name_JwtSigningKey 'Microsoft.KeyVault/vaults/secrets@2024-12-01-preview' = {
  parent: vaults_projectdemo_local_name_resource
  location: 'eastus'
  name: 'JwtSigningKey'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

