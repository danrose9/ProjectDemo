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

resource mongoClusters_mongo_projectdemo_name_resource 'Microsoft.DocumentDB/mongoClusters@2024-10-01-preview' = {
  location: 'switzerlandnorth'
  name: mongoClusters_mongo_projectdemo_name
  properties: {
    administrator: {
      userName: 'projectdemoadmin'
    }
    backup: {}
    compute: {
      tier: 'Free'
    }
    dataApi: {
      mode: 'Disabled'
    }
    highAvailability: {
      targetMode: 'Disabled'
    }
    publicNetworkAccess: 'Enabled'
    serverVersion: '8.0'
    sharding: {
      shardCount: 1
    }
    storage: {
      sizeGb: 32
    }
  }
}

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

resource privateDnsZones_privatelink_mongo_cosmos_azure_com_name_resource 'Microsoft.Network/privateDnsZones@2024-06-01' = {
  location: 'global'
  name: privateDnsZones_privatelink_mongo_cosmos_azure_com_name
  properties: {}
}

resource privateDnsZones_privatelink_mongocluster_cosmos_azure_com_name_resource 'Microsoft.Network/privateDnsZones@2024-06-01' = {
  location: 'global'
  name: privateDnsZones_privatelink_mongocluster_cosmos_azure_com_name
  properties: {}
}

resource virtualNetworks_vnet_projectdemo_name_resource 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  location: 'eastus'
  name: virtualNetworks_vnet_projectdemo_name
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    enableDdosProtection: false
    encryption: {
      enabled: false
      enforcement: 'AllowUnencrypted'
    }
    privateEndpointVNetPolicies: 'Disabled'
    subnets: [
      {
        id: virtualNetworks_vnet_projectdemo_name_default.id
        name: 'default'
        properties: {
          addressPrefixes: [
            '10.0.0.0/24'
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
  }
}

resource servers_project_demo_sql_server_name_resource 'Microsoft.Sql/servers@2024-05-01-preview' = {
  kind: 'v12.0'
  location: 'eastus2'
  name: servers_project_demo_sql_server_name
  properties: {
    administratorLogin: 'CloudSA407edb68'
    administrators: {
      administratorType: 'ActiveDirectory'
      azureADOnlyAuthentication: true
      login: 'dan@reddog32.com'
      principalType: 'User'
      sid: 'ac63d440-3ec6-4217-8121-c62ca979c3b9'
      tenantId: '73bf9c05-bd27-4332-a610-bb1a50300369'
    }
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Enabled'
    restrictOutboundNetworkAccess: 'Disabled'
    version: '12.0'
  }
}

resource storageAccounts_projectdemostorage_name_resource 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  kind: 'StorageV2'
  location: 'eastus2'
  name: storageAccounts_projectdemostorage_name
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    allowCrossTenantReplication: false
    encryption: {
      keySource: 'Microsoft.Storage'
      services: {
        blob: {
          enabled: true
          keyType: 'Account'
        }
        file: {
          enabled: true
          keyType: 'Account'
        }
      }
    }
    minimumTlsVersion: 'TLS1_0'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
      ipRules: [
        {
          action: 'Allow'
          value: '95.166.23.32'
        }
      ]
      resourceAccessRules: []
      virtualNetworkRules: []
    }
    publicNetworkAccess: 'Enabled'
    supportsHttpsTrafficOnly: true
  }
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
}

resource serverfarms_ASP_ProjectDemo_ca6e_name_resource 'Microsoft.Web/serverfarms@2024-04-01' = {
  kind: 'app'
  location: 'East US 2'
  name: serverfarms_ASP_ProjectDemo_ca6e_name
  properties: {
    elasticScaleEnabled: false
    hyperV: false
    isSpot: false
    isXenon: false
    maximumElasticWorkerCount: 1
    perSiteScaling: false
    reserved: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
  }
  sku: {
    capacity: 0
    family: 'F'
    name: 'F1'
    size: 'F1'
    tier: 'Free'
  }
  tags: {
    project: 'project-demo'
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

resource Microsoft_Network_privateDnsZones_SOA_privateDnsZones_privatelink_mongo_cosmos_azure_com_name 'Microsoft.Network/privateDnsZones/SOA@2024-06-01' = {
  parent: privateDnsZones_privatelink_mongo_cosmos_azure_com_name_resource
  name: '@'
  properties: {
    soaRecord: {
      email: 'azureprivatedns-host.microsoft.com'
      expireTime: 2419200
      host: 'azureprivatedns.net'
      minimumTtl: 10
      refreshTime: 3600
      retryTime: 300
      serialNumber: 1
    }
    ttl: 3600
  }
}

resource Microsoft_Network_privateDnsZones_SOA_privateDnsZones_privatelink_mongocluster_cosmos_azure_com_name 'Microsoft.Network/privateDnsZones/SOA@2024-06-01' = {
  parent: privateDnsZones_privatelink_mongocluster_cosmos_azure_com_name_resource
  name: '@'
  properties: {
    soaRecord: {
      email: 'azureprivatedns-host.microsoft.com'
      expireTime: 2419200
      host: 'azureprivatedns.net'
      minimumTtl: 10
      refreshTime: 3600
      retryTime: 300
      serialNumber: 1
    }
    ttl: 3600
  }
}

resource virtualNetworks_vnet_projectdemo_name_default 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: '${virtualNetworks_vnet_projectdemo_name}/default'
  properties: {
    addressPrefixes: [
      '10.0.0.0/24'
    ]
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_projectdemo_name_resource
  ]
}

resource servers_project_demo_sql_server_name_ActiveDirectory 'Microsoft.Sql/servers/administrators@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'ActiveDirectory'
  properties: {
    administratorType: 'ActiveDirectory'
    login: 'dan@reddog32.com'
    sid: 'ac63d440-3ec6-4217-8121-c62ca979c3b9'
    tenantId: '73bf9c05-bd27-4332-a610-bb1a50300369'
  }
}

resource servers_project_demo_sql_server_name_Default 'Microsoft.Sql/servers/advancedThreatProtectionSettings@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource servers_project_demo_sql_server_name_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_project_demo_sql_server_name_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_project_demo_sql_server_name_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_project_demo_sql_server_name_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_project_demo_sql_server_name_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource Microsoft_Sql_servers_auditingPolicies_servers_project_demo_sql_server_name_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  parent: servers_project_demo_sql_server_name_resource
  location: 'East US 2'
  name: 'Default'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_servers_project_demo_sql_server_name_Default 'Microsoft.Sql/servers/auditingSettings@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'default'
  properties: {
    auditActionsAndGroups: []
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    isStorageSecondaryKeyInUse: false
    retentionDays: 0
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_azureADOnlyAuthentications_servers_project_demo_sql_server_name_Default 'Microsoft.Sql/servers/azureADOnlyAuthentications@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'Default'
  properties: {
    azureADOnlyAuthentication: true
  }
}

resource Microsoft_Sql_servers_connectionPolicies_servers_project_demo_sql_server_name_default 'Microsoft.Sql/servers/connectionPolicies@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  location: 'eastus2'
  name: 'default'
  properties: {
    connectionType: 'Default'
  }
}

resource servers_project_demo_sql_server_name_ProjectDemoSql 'Microsoft.Sql/servers/databases@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  kind: 'v12.0,user,vcore,serverless'
  location: 'eastus2'
  name: 'ProjectDemoSql'
  properties: {
    autoPauseDelay: 60
    availabilityZone: 'NoPreference'
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    isLedgerOn: false
    maintenanceConfigurationId: '/subscriptions/c2a2f372-d73c-426e-985d-aeeb69f56647/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    maxSizeBytes: 2147483648
    minCapacity: json('0.5')
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Local'
    zoneRedundant: false
  }
  sku: {
    capacity: 1
    family: 'Gen5'
    name: 'GP_S_Gen5'
    tier: 'GeneralPurpose'
  }
  tags: {
    project: 'project-demo'
  }
}

resource servers_project_demo_sql_server_name_master_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2024-05-01-preview' = {
  name: '${servers_project_demo_sql_server_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_project_demo_sql_server_name_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  location: 'East US 2'
  name: '${servers_project_demo_sql_server_name}/master/Default'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_project_demo_sql_server_name_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2024-05-01-preview' = {
  name: '${servers_project_demo_sql_server_name}/master/Default'
  properties: {
    isAzureMonitorTargetEnabled: false
    retentionDays: 0
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_project_demo_sql_server_name_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2024-05-01-preview' = {
  name: '${servers_project_demo_sql_server_name}/master/Default'
  properties: {
    isAzureMonitorTargetEnabled: false
    retentionDays: 0
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_project_demo_sql_server_name_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2024-05-01-preview' = {
  name: '${servers_project_demo_sql_server_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource servers_project_demo_sql_server_name_master_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2024-05-01-preview' = {
  name: '${servers_project_demo_sql_server_name}/master/Current'
  properties: {}
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_project_demo_sql_server_name_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2024-05-01-preview' = {
  name: '${servers_project_demo_sql_server_name}/master/Default'
  properties: {
    disabledAlerts: [
      ''
    ]
    emailAccountAdmins: false
    emailAddresses: [
      ''
    ]
    retentionDays: 0
    state: 'Disabled'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_project_demo_sql_server_name_master_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2024-05-01-preview' = {
  name: '${servers_project_demo_sql_server_name}/master/Current'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_project_demo_sql_server_name_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2024-05-01-preview' = {
  name: '${servers_project_demo_sql_server_name}/master/Default'
  properties: {
    recurringScans: {
      emailSubscriptionAdmins: true
      isEnabled: false
    }
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_devOpsAuditingSettings_servers_project_demo_sql_server_name_Default 'Microsoft.Sql/servers/devOpsAuditingSettings@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'Default'
  properties: {
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_project_demo_sql_server_name_current 'Microsoft.Sql/servers/encryptionProtector@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  kind: 'servicemanaged'
  name: 'current'
  properties: {
    autoRotationEnabled: false
    serverKeyName: 'ServiceManaged'
    serverKeyType: 'ServiceManaged'
  }
}

resource Microsoft_Sql_servers_extendedAuditingSettings_servers_project_demo_sql_server_name_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'default'
  properties: {
    auditActionsAndGroups: []
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    isStorageSecondaryKeyInUse: false
    retentionDays: 0
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_project_demo_sql_server_name_ClientIPAddress_2025_6_23_22_2_26 'Microsoft.Sql/servers/firewallRules@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'ClientIPAddress_2025-6-23_22-2-26'
  properties: {
    endIpAddress: '95.166.23.32'
    startIpAddress: '95.166.23.32'
  }
}

resource servers_project_demo_sql_server_name_ServiceManaged 'Microsoft.Sql/servers/keys@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  kind: 'servicemanaged'
  name: 'ServiceManaged'
  properties: {
    serverKeyType: 'ServiceManaged'
  }
}

resource Microsoft_Sql_servers_securityAlertPolicies_servers_project_demo_sql_server_name_Default 'Microsoft.Sql/servers/securityAlertPolicies@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'Default'
  properties: {
    disabledAlerts: [
      ''
    ]
    emailAccountAdmins: false
    emailAddresses: [
      ''
    ]
    retentionDays: 0
    state: 'Disabled'
  }
}

resource Microsoft_Sql_servers_sqlVulnerabilityAssessments_servers_project_demo_sql_server_name_Default 'Microsoft.Sql/servers/sqlVulnerabilityAssessments@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource Microsoft_Sql_servers_vulnerabilityAssessments_servers_project_demo_sql_server_name_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_resource
  name: 'Default'
  properties: {
    recurringScans: {
      emailSubscriptionAdmins: true
      isEnabled: false
    }
    storageContainerPath: vulnerabilityAssessments_Default_storageContainerPath
  }
}

resource storageAccounts_projectdemostorage_name_default 'Microsoft.Storage/storageAccounts/blobServices@2024-01-01' = {
  parent: storageAccounts_projectdemostorage_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: false
    }
    isVersioningEnabled: true
  }
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_projectdemostorage_name_default 'Microsoft.Storage/storageAccounts/fileServices@2024-01-01' = {
  parent: storageAccounts_projectdemostorage_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
    protocolSettings: {
      smb: {}
    }
    shareDeleteRetentionPolicy: {
      days: 7
      enabled: true
    }
  }
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_projectdemostorage_name_default 'Microsoft.Storage/storageAccounts/queueServices@2024-01-01' = {
  parent: storageAccounts_projectdemostorage_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_projectdemostorage_name_default 'Microsoft.Storage/storageAccounts/tableServices@2024-01-01' = {
  parent: storageAccounts_projectdemostorage_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource sites_ProjectDemoApi_name_0a14fa631c65444191fa10bcce046f7a 'Microsoft.Web/sites/deployments@2024-04-01' = {
  parent: sites_ProjectDemoApi_name_resource
  location: 'East US 2'
  name: '0a14fa631c65444191fa10bcce046f7a'
  properties: {
    active: false
    author: 'N/A'
    author_email: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    end_time: '2025-06-05T15:44:14.867346Z'
    message: '{"type":"deployment","sha":"f5e3095a1a4c63e4ecadf3589cc0f5400c6017b9","repoName":"danrose9/ProjectDemo","actor":"danrose9","slotName":"production","commitMessage":"configure app insights"}'
    start_time: '2025-06-05T15:44:12.0390927Z'
    status: 4
  }
}

resource sites_ProjectDemoApi_name_139741a50569456c98a588f16dc95c8c 'Microsoft.Web/sites/deployments@2024-04-01' = {
  parent: sites_ProjectDemoApi_name_resource
  location: 'East US 2'
  name: '139741a50569456c98a588f16dc95c8c'
  properties: {
    active: false
    author: 'N/A'
    author_email: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    end_time: '2025-06-06T11:15:21.890365Z'
    message: '{"type":"deployment","sha":"d51b9f2b82727cffc9becdb09f0f8dbcae3ae11c","repoName":"danrose9/ProjectDemo","actor":"danrose9","slotName":"production","commitMessage":"updated log-trace endpoint to environment"}'
    start_time: '2025-06-06T11:15:20.6715731Z'
    status: 4
  }
}

resource sites_ProjectDemoApi_name_2f8fe0c4a8d546d19a5c799f372601ad 'Microsoft.Web/sites/deployments@2024-04-01' = {
  parent: sites_ProjectDemoApi_name_resource
  location: 'East US 2'
  name: '2f8fe0c4a8d546d19a5c799f372601ad'
  properties: {
    active: false
    author: 'N/A'
    author_email: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    end_time: '2025-06-05T14:32:36.8108432Z'
    message: '{"type":"deployment","sha":"9476cde2ae87f4803414d0bd529788d758597776","repoName":"danrose9/ProjectDemo","actor":"danrose9","slotName":"production","commitMessage":"added appinsights instrumentation key"}'
    start_time: '2025-06-05T14:32:33.732618Z'
    status: 4
  }
}

resource sites_ProjectDemoApi_name_3087a041313e40bf809f607934b99772 'Microsoft.Web/sites/deployments@2024-04-01' = {
  parent: sites_ProjectDemoApi_name_resource
  location: 'East US 2'
  name: '3087a041313e40bf809f607934b99772'
  properties: {
    active: false
    author: 'N/A'
    author_email: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    end_time: '2025-06-05T13:31:57.4031863Z'
    message: '{"type":"deployment","sha":"20094ce3a6918398491d3d8af4558e730357d1d4","repoName":"danrose9/ProjectDemo","actor":"danrose9","slotName":"production","commitMessage":"troubleshooting jwt"}'
    start_time: '2025-06-05T13:31:50.9338418Z'
    status: 4
  }
}

resource sites_ProjectDemoApi_name_5f144785e13f4f8f8fbd03045c90e796 'Microsoft.Web/sites/deployments@2024-04-01' = {
  parent: sites_ProjectDemoApi_name_resource
  location: 'East US 2'
  name: '5f144785e13f4f8f8fbd03045c90e796'
  properties: {
    active: false
    author: 'N/A'
    author_email: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    end_time: '2025-06-05T13:36:24.7567658Z'
    message: '{"type":"deployment","sha":"a47f118f39a1eb72a373601fca63c27dafdb9bb5","repoName":"danrose9/ProjectDemo","actor":"danrose9","slotName":"production","commitMessage":"troubleshooting jwt"}'
    start_time: '2025-06-05T13:36:21.7722893Z'
    status: 4
  }
}

resource sites_ProjectDemoApi_name_7e0cdfa9be054add9c635432b69f93de 'Microsoft.Web/sites/deployments@2024-04-01' = {
  parent: sites_ProjectDemoApi_name_resource
  location: 'East US 2'
  name: '7e0cdfa9be054add9c635432b69f93de'
  properties: {
    active: false
    author: 'N/A'
    author_email: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    end_time: '2025-06-05T15:23:50.1451027Z'
    message: '{"type":"deployment","sha":"50b25adc7aa8d4452cf4c15a206246c54df148cb","repoName":"danrose9/ProjectDemo","actor":"danrose9","slotName":"production","commitMessage":"configure app insights"}'
    start_time: '2025-06-05T15:23:47.2856248Z'
    status: 4
  }
}

resource sites_ProjectDemoApi_name_82ef1550506d41d2a474d6af8464cd24 'Microsoft.Web/sites/deployments@2024-04-01' = {
  parent: sites_ProjectDemoApi_name_resource
  location: 'East US 2'
  name: '82ef1550506d41d2a474d6af8464cd24'
  properties: {
    active: true
    author: 'N/A'
    author_email: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    end_time: '2025-06-09T16:35:37.1964473Z'
    message: '{"type":"deployment","sha":"3cbb6760102b2b6c47dce5f4c2b7aa224878a8d0","repoName":"danrose9/ProjectDemo","actor":"danrose9","slotName":"production","commitMessage":"cleanup"}'
    start_time: '2025-06-09T16:35:35.0624691Z'
    status: 4
  }
}

resource sites_ProjectDemoApi_name_83ca78eb5bec46868b1cd90632ef6520 'Microsoft.Web/sites/deployments@2024-04-01' = {
  parent: sites_ProjectDemoApi_name_resource
  location: 'East US 2'
  name: '83ca78eb5bec46868b1cd90632ef6520'
  properties: {
    active: false
    author: 'N/A'
    author_email: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    end_time: '2025-06-05T15:55:25.3028072Z'
    message: '{"type":"deployment","sha":"042b135c58d926de0d89a70ef8a30bf6c126cc36","repoName":"danrose9/ProjectDemo","actor":"danrose9","slotName":"production","commitMessage":"configure app insights"}'
    start_time: '2025-06-05T15:55:22.250623Z'
    status: 4
  }
}

resource sites_ProjectDemoApi_name_977ebb3db053469195a79386967ff14e 'Microsoft.Web/sites/deployments@2024-04-01' = {
  parent: sites_ProjectDemoApi_name_resource
  location: 'East US 2'
  name: '977ebb3db053469195a79386967ff14e'
  properties: {
    active: false
    author: 'N/A'
    author_email: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    end_time: '2025-06-05T13:44:57.3704605Z'
    message: '{"type":"deployment","sha":"c7728a58924b18975813ee130157edea553985a5","repoName":"danrose9/ProjectDemo","actor":"danrose9","slotName":"production","commitMessage":"troubleshooting jwt"}'
    start_time: '2025-06-05T13:44:54.2140829Z'
    status: 4
  }
}

resource sites_ProjectDemoApi_name_a09fc1422fe4407f8edd2c581c7553ff 'Microsoft.Web/sites/deployments@2024-04-01' = {
  parent: sites_ProjectDemoApi_name_resource
  location: 'East US 2'
  name: 'a09fc1422fe4407f8edd2c581c7553ff'
  properties: {
    active: false
    author: 'N/A'
    author_email: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY'
    end_time: '2025-06-05T13:55:38.0278829Z'
    message: '{"type":"deployment","sha":"5e73e2b3e2a17c837f1987219fe7bc90e601a555","repoName":"danrose9/ProjectDemo","actor":"danrose9","slotName":"production","commitMessage":"added appinsights package"}'
    start_time: '2025-06-05T13:55:35.15048Z'
    status: 4
  }
}

resource sites_ProjectDemoApi_name_sites_ProjectDemoApi_name_hfdecyeea8gyacbg_eastus2_01_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2024-04-01' = {
  parent: sites_ProjectDemoApi_name_resource
  location: 'East US 2'
  name: '${sites_ProjectDemoApi_name}-hfdecyeea8gyacbg.eastus2-01.azurewebsites.net'
  properties: {
    hostNameType: 'Verified'
    siteName: 'ProjectDemoApi'
  }
}

resource servers_project_demo_sql_server_name_ProjectDemoSql_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_ProjectDemoSql
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_project_demo_sql_server_name_ProjectDemoSql_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_project_demo_sql_server_name_ProjectDemoSql
  location: 'East US 2'
  name: 'Default'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_project_demo_sql_server_name_ProjectDemoSql_Default 'Microsoft.Sql/servers/databases/auditingSettings@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_ProjectDemoSql
  name: 'default'
  properties: {
    isAzureMonitorTargetEnabled: false
    retentionDays: 0
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_project_demo_sql_server_name_ProjectDemoSql_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_ProjectDemoSql
  name: 'default'
  properties: {
    monthlyRetention: 'PT0S'
    weekOfYear: 0
    weeklyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_project_demo_sql_server_name_ProjectDemoSql_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_ProjectDemoSql
  name: 'default'
  properties: {
    diffBackupIntervalInHours: 12
    retentionDays: 7
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_project_demo_sql_server_name_ProjectDemoSql_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_ProjectDemoSql
  name: 'default'
  properties: {
    isAzureMonitorTargetEnabled: false
    retentionDays: 0
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_project_demo_sql_server_name_ProjectDemoSql_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_ProjectDemoSql
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource servers_project_demo_sql_server_name_ProjectDemoSql_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_ProjectDemoSql
  name: 'Current'
  properties: {}
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_project_demo_sql_server_name_ProjectDemoSql_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_ProjectDemoSql
  name: 'Default'
  properties: {
    disabledAlerts: [
      ''
    ]
    emailAccountAdmins: false
    emailAddresses: [
      ''
    ]
    retentionDays: 0
    state: 'Disabled'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_project_demo_sql_server_name_ProjectDemoSql_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_ProjectDemoSql
  name: 'Current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_project_demo_sql_server_name_ProjectDemoSql_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2024-05-01-preview' = {
  parent: servers_project_demo_sql_server_name_ProjectDemoSql
  name: 'Default'
  properties: {
    recurringScans: {
      emailSubscriptionAdmins: true
      isEnabled: false
    }
  }
  dependsOn: [
    servers_project_demo_sql_server_name_resource
  ]
}

resource storageAccounts_projectdemostorage_name_default_armstate 'Microsoft.Storage/storageAccounts/blobServices/containers@2024-01-01' = {
  parent: storageAccounts_projectdemostorage_name_default
  name: 'armstate'
  properties: {
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    immutableStorageWithVersioning: {
      enabled: true
    }
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_projectdemostorage_name_resource
  ]
}

resource storageAccounts_projectdemostorage_name_default_tfstate 'Microsoft.Storage/storageAccounts/blobServices/containers@2024-01-01' = {
  parent: storageAccounts_projectdemostorage_name_default
  name: 'tfstate'
  properties: {
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    immutableStorageWithVersioning: {
      enabled: false
    }
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_projectdemostorage_name_resource
  ]
}

