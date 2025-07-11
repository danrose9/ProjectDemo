param mongoClusters_mongo_projectdemo_name string = 'mongo-projectdemo'
param servers_project_demo_sql_server_name string = 'project-demo-sql-server'

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

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseBigDataPoolApplicationsEnded 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseBigDataPoolApplicationsEnded'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseBigDataPoolApplicationsEnded'
      name: 'SynapseBigDataPoolApplicationsEnded'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseBuiltinSqlPoolRequestsEnded 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseBuiltinSqlPoolRequestsEnded'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseBuiltinSqlPoolRequestsEnded'
      name: 'SynapseBuiltinSqlPoolRequestsEnded'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseDXCommand 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseDXCommand'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseDXCommand'
      name: 'SynapseDXCommand'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseDXFailedIngestion 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseDXFailedIngestion'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseDXFailedIngestion'
      name: 'SynapseDXFailedIngestion'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseDXIngestionBatching 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseDXIngestionBatching'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseDXIngestionBatching'
      name: 'SynapseDXIngestionBatching'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseDXQuery 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseDXQuery'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseDXQuery'
      name: 'SynapseDXQuery'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseDXSucceededIngestion 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseDXSucceededIngestion'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseDXSucceededIngestion'
      name: 'SynapseDXSucceededIngestion'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseDXTableDetails 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseDXTableDetails'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseDXTableDetails'
      name: 'SynapseDXTableDetails'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseDXTableUsageStatistics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseDXTableUsageStatistics'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseDXTableUsageStatistics'
      name: 'SynapseDXTableUsageStatistics'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseGatewayApiRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseGatewayApiRequests'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseGatewayApiRequests'
      name: 'SynapseGatewayApiRequests'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseIntegrationActivityRuns 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseIntegrationActivityRuns'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseIntegrationActivityRuns'
      name: 'SynapseIntegrationActivityRuns'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseIntegrationPipelineRuns 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseIntegrationPipelineRuns'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseIntegrationPipelineRuns'
      name: 'SynapseIntegrationPipelineRuns'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseIntegrationTriggerRuns 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseIntegrationTriggerRuns'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseIntegrationTriggerRuns'
      name: 'SynapseIntegrationTriggerRuns'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseLinkEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseLinkEvent'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseLinkEvent'
      name: 'SynapseLinkEvent'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseRbacOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseRbacOperations'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseRbacOperations'
      name: 'SynapseRbacOperations'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseScopePoolScopeJobsEnded 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseScopePoolScopeJobsEnded'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseScopePoolScopeJobsEnded'
      name: 'SynapseScopePoolScopeJobsEnded'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseScopePoolScopeJobsStateChange 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseScopePoolScopeJobsStateChange'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseScopePoolScopeJobsStateChange'
      name: 'SynapseScopePoolScopeJobsStateChange'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseSqlPoolDmsWorkers 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseSqlPoolDmsWorkers'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseSqlPoolDmsWorkers'
      name: 'SynapseSqlPoolDmsWorkers'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseSqlPoolExecRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseSqlPoolExecRequests'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseSqlPoolExecRequests'
      name: 'SynapseSqlPoolExecRequests'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseSqlPoolRequestSteps 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseSqlPoolRequestSteps'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseSqlPoolRequestSteps'
      name: 'SynapseSqlPoolRequestSteps'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseSqlPoolSqlRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseSqlPoolSqlRequests'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseSqlPoolSqlRequests'
      name: 'SynapseSqlPoolSqlRequests'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_SynapseSqlPoolWaits 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'SynapseSqlPoolWaits'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'SynapseSqlPoolWaits'
      name: 'SynapseSqlPoolWaits'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_Syslog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'Syslog'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'Syslog'
      name: 'Syslog'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_TOUserAudits 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'TOUserAudits'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'TOUserAudits'
      name: 'TOUserAudits'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_TOUserDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'TOUserDiagnostics'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'TOUserDiagnostics'
      name: 'TOUserDiagnostics'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_TSIIngress 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'TSIIngress'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'TSIIngress'
      name: 'TSIIngress'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_UCClient 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'UCClient'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'UCClient'
      name: 'UCClient'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_UCClientReadinessStatus 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'UCClientReadinessStatus'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'UCClientReadinessStatus'
      name: 'UCClientReadinessStatus'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_UCClientUpdateStatus 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'UCClientUpdateStatus'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'UCClientUpdateStatus'
      name: 'UCClientUpdateStatus'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_UCDeviceAlert 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'UCDeviceAlert'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'UCDeviceAlert'
      name: 'UCDeviceAlert'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_UCDOAggregatedStatus 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'UCDOAggregatedStatus'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'UCDOAggregatedStatus'
      name: 'UCDOAggregatedStatus'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_UCDOStatus 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'UCDOStatus'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'UCDOStatus'
      name: 'UCDOStatus'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_UCServiceUpdateStatus 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'UCServiceUpdateStatus'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'UCServiceUpdateStatus'
      name: 'UCServiceUpdateStatus'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_UCUpdateAlert 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'UCUpdateAlert'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'UCUpdateAlert'
      name: 'UCUpdateAlert'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_Usage 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'Usage'
  properties: {
    plan: 'Analytics'
    retentionInDays: 90
    schema: {
      displayName: 'Usage'
      name: 'Usage'
    }
    totalRetentionInDays: 90
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_VCoreMongoRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'VCoreMongoRequests'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'VCoreMongoRequests'
      name: 'VCoreMongoRequests'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_VIAudit 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'VIAudit'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'VIAudit'
      name: 'VIAudit'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_VIIndexing 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'VIIndexing'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'VIIndexing'
      name: 'VIIndexing'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_VMBoundPort 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'VMBoundPort'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'VMBoundPort'
      name: 'VMBoundPort'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_VMComputer 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'VMComputer'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'VMComputer'
      name: 'VMComputer'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_VMConnection 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'VMConnection'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'VMConnection'
      name: 'VMConnection'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_VMProcess 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'VMProcess'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'VMProcess'
      name: 'VMProcess'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_W3CIISLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'W3CIISLog'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'W3CIISLog'
      name: 'W3CIISLog'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WebPubSubConnectivity 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WebPubSubConnectivity'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WebPubSubConnectivity'
      name: 'WebPubSubConnectivity'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WebPubSubHttpRequest 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WebPubSubHttpRequest'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WebPubSubHttpRequest'
      name: 'WebPubSubHttpRequest'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WebPubSubMessaging 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WebPubSubMessaging'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WebPubSubMessaging'
      name: 'WebPubSubMessaging'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_Windows365AuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'Windows365AuditLogs'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'Windows365AuditLogs'
      name: 'Windows365AuditLogs'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WindowsClientAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WindowsClientAssessmentRecommendation'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WindowsClientAssessmentRecommendation'
      name: 'WindowsClientAssessmentRecommendation'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WindowsServerAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WindowsServerAssessmentRecommendation'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WindowsServerAssessmentRecommendation'
      name: 'WindowsServerAssessmentRecommendation'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WorkloadDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WorkloadDiagnosticLogs'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WorkloadDiagnosticLogs'
      name: 'WorkloadDiagnosticLogs'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WOUserAudits 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WOUserAudits'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WOUserAudits'
      name: 'WOUserAudits'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WOUserDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WOUserDiagnostics'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WOUserDiagnostics'
      name: 'WOUserDiagnostics'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WVDAgentHealthStatus 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WVDAgentHealthStatus'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WVDAgentHealthStatus'
      name: 'WVDAgentHealthStatus'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WVDAutoscaleEvaluationPooled 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WVDAutoscaleEvaluationPooled'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WVDAutoscaleEvaluationPooled'
      name: 'WVDAutoscaleEvaluationPooled'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WVDCheckpoints 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WVDCheckpoints'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WVDCheckpoints'
      name: 'WVDCheckpoints'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WVDConnectionGraphicsDataPreview 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WVDConnectionGraphicsDataPreview'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WVDConnectionGraphicsDataPreview'
      name: 'WVDConnectionGraphicsDataPreview'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WVDConnectionNetworkData 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WVDConnectionNetworkData'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WVDConnectionNetworkData'
      name: 'WVDConnectionNetworkData'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WVDConnections 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WVDConnections'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WVDConnections'
      name: 'WVDConnections'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WVDErrors 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WVDErrors'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WVDErrors'
      name: 'WVDErrors'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WVDFeeds 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WVDFeeds'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WVDFeeds'
      name: 'WVDFeeds'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WVDHostRegistrations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WVDHostRegistrations'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WVDHostRegistrations'
      name: 'WVDHostRegistrations'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WVDManagement 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WVDManagement'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WVDManagement'
      name: 'WVDManagement'
    }
    totalRetentionInDays: 30
  }
}

resource workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_WVDSessionHostManagement 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_DefaultWorkspace_c2a2f372_d73c_426e_985d_aeeb69f56647_EUS_name_resource
  name: 'WVDSessionHostManagement'
  properties: {
    plan: 'Analytics'
    retentionInDays: 30
    schema: {
      displayName: 'WVDSessionHostManagement'
      name: 'WVDSessionHostManagement'
    }
    totalRetentionInDays: 30
  }
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
