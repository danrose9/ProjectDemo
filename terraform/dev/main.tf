resource "azurerm_resource_group" "res-0" {
  location = "eastus"
  name     = "RG-ProjectDemo-Dev"
}
resource "azurerm_key_vault" "res-1" {
  enable_rbac_authorization = true
  location                  = "eastus"
  name                      = "projectdemo-dev"
  resource_group_name       = "RG-ProjectDemo-Dev"
  sku_name                  = "standard"
  tenant_id                 = "73bf9c05-bd27-4332-a610-bb1a50300369"
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_key_vault" "res-5" {
  enable_rbac_authorization = true
  location                  = "eastus"
  name                      = "projectdemo-local"
  resource_group_name       = "RG-ProjectDemo-Dev"
  sku_name                  = "standard"
  tenant_id                 = "73bf9c05-bd27-4332-a610-bb1a50300369"
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_mssql_server" "res-640" {
  administrator_login = "CloudSA407edb68"
  location            = "eastus2"
  name                = "project-demo-sql-server"
  resource_group_name = "RG-ProjectDemo-Dev"
  version             = "12.0"
  administrator_login_password = "administrator_login_password"
  azuread_administrator {
    login_username = "dan@reddog32.com"
    object_id      = "ac63d440-3ec6-4217-8121-c62ca979c3b9"
  }
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_mssql_database" "res-652" {
  name                 = "ProjectDemoSql"
  server_id            = azurerm_mssql_server.res-640.id
  storage_account_type = "Local"
  tags = {
    project = "project-demo"
  }
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-658" {
  database_id            = azurerm_mssql_database.res-652.id
  enabled                = false
  log_monitoring_enabled = false
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-667" {
  database_id            = "/subscriptions/c2a2f372-d73c-426e-985d-aeeb69f56647/resourceGroups/RG-ProjectDemo-Dev/providers/Microsoft.Sql/servers/project-demo-sql-server/databases/master"
  enabled                = false
  log_monitoring_enabled = false
}
resource "azurerm_mssql_server_microsoft_support_auditing_policy" "res-673" {
  enabled                = false
  log_monitoring_enabled = false
  server_id              = azurerm_mssql_server.res-640.id
}
resource "azurerm_mssql_server_transparent_data_encryption" "res-674" {
  server_id = azurerm_mssql_server.res-640.id
}
resource "azurerm_mssql_server_extended_auditing_policy" "res-675" {
  enabled                = false
  log_monitoring_enabled = false
  server_id              = azurerm_mssql_server.res-640.id
}
resource "azurerm_mssql_firewall_rule" "res-676" {
  end_ip_address   = "95.166.23.32"
  name             = "ClientIPAddress_2025-6-23_22-2-26"
  server_id        = azurerm_mssql_server.res-640.id
  start_ip_address = "95.166.23.32"
}
resource "azurerm_mssql_server_security_alert_policy" "res-678" {
  resource_group_name = "RG-ProjectDemo-Dev"
  server_name         = "project-demo-sql-server"
  state               = "Disabled"
  depends_on = [
    azurerm_mssql_server.res-640
  ]
}
resource "azurerm_mssql_server_vulnerability_assessment" "res-680" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.res-678.id
  storage_container_path          = "var.storage_container_path"
}
resource "azurerm_storage_account" "res-681" {
  account_replication_type        = "LRS"
  account_tier                    = "Standard"
  allow_nested_items_to_be_public = false
  location                        = "eastus2"
  min_tls_version                 = "TLS1_0"
  name                            = "projectdemostorage"
  resource_group_name             = "RG-ProjectDemo-Dev"
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_storage_container" "res-683" {
  name               = "tfstate"
  storage_account_id = "/subscriptions/c2a2f372-d73c-426e-985d-aeeb69f56647/resourceGroups/RG-ProjectDemo-Dev/providers/Microsoft.Storage/storageAccounts/projectdemostorage"
  depends_on = [
    # One of azurerm_storage_account.res-681,azurerm_storage_account_queue_properties.res-685 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_storage_account_queue_properties" "res-685" {
  storage_account_id = azurerm_storage_account.res-681.id
  hour_metrics {
    version = "1.0"
  }
  logging {
    delete  = false
    read    = false
    version = "1.0"
    write   = false
  }
  minute_metrics {
    version = "1.0"
  }
}
resource "azurerm_service_plan" "res-687" {
  location            = "eastus2"
  name                = "ASP-ProjectDemo-ca6e"
  os_type             = "Windows"
  resource_group_name = "RG-ProjectDemo-Dev"
  sku_name            = "F1"
  tags = {
    project = "project-demo"
  }
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_windows_web_app" "res-688" {
  app_settings = {
    APPLICATIONINSIGHTS_CONNECTION_STRING      = "InstrumentationKey=d0f5754e-4b06-4d13-a61e-78b7baf34c1f;IngestionEndpoint=https://eastus-8.in.applicationinsights.azure.com/;LiveEndpoint=https://eastus.livediagnostics.monitor.azure.com/;ApplicationId=216cb555-6a68-45cd-8fc9-1e4c8f915d4c"
    ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
    KeyVault__Url                              = "https://projectdemo-dev.vault.azure.net/"
    XDT_MicrosoftApplicationInsights_Mode      = "default"
  }
  client_affinity_enabled                  = true
  ftp_publish_basic_authentication_enabled = false
  https_only                               = true
  location                                 = "eastus2"
  name                                     = "ProjectDemoApi"
  resource_group_name                      = "RG-ProjectDemo-Dev"
  service_plan_id                          = azurerm_service_plan.res-687.id
  tags = {
    "hidden-link: /app-insights-conn-string"         = "InstrumentationKey=d0f5754e-4b06-4d13-a61e-78b7baf34c1f;IngestionEndpoint=https://eastus-8.in.applicationinsights.azure.com/;LiveEndpoint=https://eastus.livediagnostics.monitor.azure.com/;ApplicationId=216cb555-6a68-45cd-8fc9-1e4c8f915d4c"
    "hidden-link: /app-insights-instrumentation-key" = "d0f5754e-4b06-4d13-a61e-78b7baf34c1f"
    "hidden-link: /app-insights-resource-id"         = "/subscriptions/c2a2f372-d73c-426e-985d-aeeb69f56647/resourceGroups/RG-ProjectDemo-Dev/providers/microsoft.insights/components/ProjectDemo-AppInsights"
    project                                          = "projectDemo"
  }
  logs {
    http_logs {
      file_system {
        retention_in_days = 1
        retention_in_mb   = 35
      }
    }
  }
  site_config {
    always_on                         = false
    ftps_state                        = "FtpsOnly"
    ip_restriction_default_action     = "Deny"
    scm_ip_restriction_default_action = "Deny"
  }
}
resource "azurerm_app_service_custom_hostname_binding" "res-702" {
  app_service_name    = "ProjectDemoApi"
  hostname            = "projectdemoapi-hfdecyeea8gyacbg.eastus2-01.azurewebsites.net"
  resource_group_name = "RG-ProjectDemo-Dev"
  depends_on = [
    azurerm_windows_web_app.res-688
  ]
}
resource "azurerm_monitor_action_group" "res-703" {
  name                = "Application Insights Smart Detection"
  resource_group_name = "RG-ProjectDemo-Dev"
  short_name          = "SmartDetect"
  arm_role_receiver {
    name                    = "Monitoring Contributor"
    role_id                 = "749f88d5-cbae-40b8-bcfc-e573ddc772fa"
    use_common_alert_schema = true
  }
  arm_role_receiver {
    name                    = "Monitoring Reader"
    role_id                 = "43d0d8ad-25c7-4714-9337-8ba259a9fe05"
    use_common_alert_schema = true
  }
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_application_insights" "res-704" {
  application_type    = "web"
  location            = "eastus"
  name                = "ProjectDemo-AppInsights"
  resource_group_name = "RG-ProjectDemo-Dev"
  sampling_percentage = 0
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_log_analytics_workspace" "res-705" {
  location            = "eastus"
  name                = "DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS"
  resource_group_name = "RG-ProjectDemo-Dev"
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
