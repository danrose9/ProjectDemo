resource "azurerm_resource_group" "res-0" {
  location = var.location
  name     = "RG-ProjectDemo-${var.environment}"
}
resource "azurerm_key_vault" "res-1" {
  enable_rbac_authorization = true
  location                  = var.location
  name                      = "projectdemo-${var.environment}"
  resource_group_name       = var.resource_group_name
  sku_name                  = "standard"
  tenant_id                 = "73bf9c05-bd27-4332-a610-bb1a50300369"
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_key_vault_secret" "res-2" {
  key_vault_id = azurerm_key_vault.res-1.id
  name         = "jwtAudience"
  value        = "https://projectdemoapi-hfdecyeea8gyacbg.eastus2-01.azurewebsites.net"
}
resource "azurerm_key_vault_secret" "res-3" {
  key_vault_id = azurerm_key_vault.res-1.id
  name         = "jwtIssuer"
  value        = "https://identity-api.azurewebsites.net"
}
resource "azurerm_key_vault_secret" "res-4" {
  key_vault_id = azurerm_key_vault.res-1.id
  name         = "jwtSigningKey"
  value        = "QWxhZGRpbpoisgTjpvcGVuIHNlc2FtZQ=="
}
resource "azurerm_key_vault" "res-5" {
  enable_rbac_authorization = true
  location                  = var.location
  name                      = "projectdemo-local"
  resource_group_name       = var.resource_group_name
  sku_name                  = "standard"
  tenant_id                 = "73bf9c05-bd27-4332-a610-bb1a50300369"
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_key_vault_secret" "res-6" {
  key_vault_id = azurerm_key_vault.res-5.id
  name         = "JwtAudience"
  value        = "https://localhost:7200"
}
resource "azurerm_key_vault_secret" "res-7" {
  key_vault_id = azurerm_key_vault.res-5.id
  name         = "JwtIssuer"
  value        = "https://localhost:7209"
}
resource "azurerm_key_vault_secret" "res-8" {
  key_vault_id = azurerm_key_vault.res-5.id
  name         = "JwtSigningKey"
  value        = "QWxhZGRpbpoisgTjpvcGVuIHNlc2FtZQ=="
}
resource "azurerm_log_analytics_saved_search" "res-9" {
  category                   = "General Exploration"
  display_name               = "All Computers with their most recent data"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_General|AlphabeticallySortedComputers"
  query                      = "search not(ObjectName == \"Advisor Metrics\" or ObjectName == \"ManagedSpace\") | summarize AggregatedValue = max(TimeGenerated) by Computer | limit 500000 | sort by Computer asc\r\n// Oql: NOT(ObjectName=\"Advisor Metrics\" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) by Computer | top 500000 | Sort Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-10" {
  category                   = "General Exploration"
  display_name               = "Stale Computers (data older than 24 hours)"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_General|StaleComputers"
  query                      = "search not(ObjectName == \"Advisor Metrics\" or ObjectName == \"ManagedSpace\") | summarize lastdata = max(TimeGenerated) by Computer | limit 500000 | where lastdata < ago(24h)\r\n// Oql: NOT(ObjectName=\"Advisor Metrics\" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) as lastdata by Computer | top 500000 | where lastdata < NOW-24HOURS // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-11" {
  category                   = "General Exploration"
  display_name               = "Which Management Group is generating the most data points?"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_General|dataPointsPerManagementGroup"
  query                      = "search * | summarize AggregatedValue = count() by ManagementGroupName\r\n// Oql: * | Measure count() by ManagementGroupName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-12" {
  category                   = "General Exploration"
  display_name               = "Distribution of data Types"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_General|dataTypeDistribution"
  query                      = "search * | extend Type = $table | summarize AggregatedValue = count() by Type\r\n// Oql: * | Measure count() by Type // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-13" {
  category                   = "Log Management"
  display_name               = "All Events"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|AllEvents"
  query                      = "Event | sort by TimeGenerated desc\r\n// Oql: Type=Event // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-14" {
  category                   = "Log Management"
  display_name               = "All Syslogs"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|AllSyslog"
  query                      = "Syslog | sort by TimeGenerated desc\r\n// Oql: Type=Syslog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-15" {
  category                   = "Log Management"
  display_name               = "All Syslog Records grouped by Facility"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|AllSyslogByFacility"
  query                      = "Syslog | summarize AggregatedValue = count() by Facility\r\n// Oql: Type=Syslog | Measure count() by Facility // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-16" {
  category                   = "Log Management"
  display_name               = "All Syslog Records grouped by ProcessName"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|AllSyslogByProcessName"
  query                      = "Syslog | summarize AggregatedValue = count() by ProcessName\r\n// Oql: Type=Syslog | Measure count() by ProcessName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-17" {
  category                   = "Log Management"
  display_name               = "All Syslog Records with Errors"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|AllSyslogsWithErrors"
  query                      = "Syslog | where SeverityLevel == \"error\" | sort by TimeGenerated desc\r\n// Oql: Type=Syslog SeverityLevel=error // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-18" {
  category                   = "Log Management"
  display_name               = "Average HTTP Request time by Client IP Address"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|AverageHTTPRequestTimeByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by cIP\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-19" {
  category                   = "Log Management"
  display_name               = "Average HTTP Request time by HTTP Method"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|AverageHTTPRequestTimeHTTPMethod"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by csMethod\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-20" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by Client IP Address"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|CountIISLogEntriesClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by cIP\r\n// Oql: Type=W3CIISLog | Measure count() by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-21" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by HTTP Request Method"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|CountIISLogEntriesHTTPRequestMethod"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csMethod\r\n// Oql: Type=W3CIISLog | Measure count() by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-22" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by HTTP User Agent"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|CountIISLogEntriesHTTPUserAgent"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUserAgent\r\n// Oql: Type=W3CIISLog | Measure count() by csUserAgent // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-23" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by Host requested by client"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|CountOfIISLogEntriesByHostRequestedByClient"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csHost\r\n// Oql: Type=W3CIISLog | Measure count() by csHost // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-24" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by URL for the host \"www.contoso.com\" (replace with your own)"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|CountOfIISLogEntriesByURLForHost"
  query                      = "search csHost == \"www.contoso.com\" | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog csHost=\"www.contoso.com\" | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-25" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by URL requested by client (without query strings)"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|CountOfIISLogEntriesByURLRequestedByClient"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-26" {
  category                   = "Log Management"
  display_name               = "Count of Events with level \"Warning\" grouped by Event ID"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|CountOfWarningEvents"
  query                      = "Event | where EventLevelName == \"warning\" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event EventLevelName=warning | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-27" {
  category                   = "Log Management"
  display_name               = "Shows breakdown of response codes"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|DisplayBreakdownRespondCodes"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by scStatus\r\n// Oql: Type=W3CIISLog | Measure count() by scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-28" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event Log"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|EventsByEventLog"
  query                      = "Event | summarize AggregatedValue = count() by EventLog\r\n// Oql: Type=Event | Measure count() by EventLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-29" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event Source"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|EventsByEventSource"
  query                      = "Event | summarize AggregatedValue = count() by Source\r\n// Oql: Type=Event | Measure count() by Source // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-30" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event ID"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|EventsByEventsID"
  query                      = "Event | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-31" {
  category                   = "Log Management"
  display_name               = "Events in the Operations Manager Event Log whose Event ID is in the range between 2000 and 3000"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|EventsInOMBetween2000to3000"
  query                      = "Event | where EventLog == \"Operations Manager\" and EventID >= 2000 and EventID <= 3000 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog=\"Operations Manager\" EventID:[2000..3000] // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-32" {
  category                   = "Log Management"
  display_name               = "Count of Events containing the word \"started\" grouped by EventID"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|EventsWithStartedinEventID"
  query                      = "search in (Event) \"started\" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event \"started\" | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-33" {
  category                   = "Log Management"
  display_name               = "Find the maximum time taken for each page"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|FindMaximumTimeTakenForEachPage"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = max(TimeTaken) by csUriStem\r\n// Oql: Type=W3CIISLog | Measure Max(TimeTaken) by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-34" {
  category                   = "Log Management"
  display_name               = "IIS Log Entries for a specific client IP Address (replace with your own)"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|IISLogEntriesForClientIP"
  query                      = "search cIP == \"192.168.0.1\" | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc | project csUriStem, scBytes, csBytes, TimeTaken, scStatus\r\n// Oql: Type=W3CIISLog cIP=\"192.168.0.1\" | Select csUriStem,scBytes,csBytes,TimeTaken,scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-35" {
  category                   = "Log Management"
  display_name               = "All IIS Log Entries"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|ListAllIISLogEntries"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc\r\n// Oql: Type=W3CIISLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-36" {
  category                   = "Log Management"
  display_name               = "How many connections to Operations Manager's SDK service by day"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|NoOfConnectionsToOMSDKService"
  query                      = "Event | where EventID == 26328 and EventLog == \"Operations Manager\" | summarize AggregatedValue = count() by bin(TimeGenerated, 1d) | sort by TimeGenerated desc\r\n// Oql: Type=Event EventID=26328 EventLog=\"Operations Manager\" | Measure count() interval 1DAY // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-37" {
  category                   = "Log Management"
  display_name               = "When did my servers initiate restart?"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|ServerRestartTime"
  query                      = "search in (Event) \"shutdown\" and EventLog == \"System\" and Source == \"User32\" and EventID == 1074 | sort by TimeGenerated desc | project TimeGenerated, Computer\r\n// Oql: shutdown Type=Event EventLog=System Source=User32 EventID=1074 | Select TimeGenerated,Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-38" {
  category                   = "Log Management"
  display_name               = "Shows which pages people are getting a 404 for"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|Show404PagesList"
  query                      = "search scStatus == 404 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog scStatus=404 | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-39" {
  category                   = "Log Management"
  display_name               = "Shows servers that are throwing internal server error"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|ShowServersThrowingInternalServerError"
  query                      = "search scStatus == 500 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by sComputerName\r\n// Oql: Type=W3CIISLog scStatus=500 | Measure count() by sComputerName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-40" {
  category                   = "Log Management"
  display_name               = "Total Bytes received by each Azure Role Instance"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|TotalBytesReceivedByEachAzureRoleInstance"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by RoleInstance\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by RoleInstance // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-41" {
  category                   = "Log Management"
  display_name               = "Total Bytes received by each IIS Computer"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|TotalBytesReceivedByEachIISComputer"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by Computer | limit 500000\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-42" {
  category                   = "Log Management"
  display_name               = "Total Bytes responded back to clients by Client IP Address"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|TotalBytesRespondedToClientsByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-43" {
  category                   = "Log Management"
  display_name               = "Total Bytes responded back to clients by each IIS ServerIP Address"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|TotalBytesRespondedToClientsByEachIISServerIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by sIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by sIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-44" {
  category                   = "Log Management"
  display_name               = "Total Bytes sent by Client IP Address"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|TotalBytesSentByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-45" {
  category                   = "Log Management"
  display_name               = "All Events with level \"Warning\""
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|WarningEvents"
  query                      = "Event | where EventLevelName == \"warning\" | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLevelName=warning // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-46" {
  category                   = "Log Management"
  display_name               = "Windows Firewall Policy settings have changed"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|WindowsFireawallPolicySettingsChanged"
  query                      = "Event | where EventLog == \"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" and EventID == 2008 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog=\"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" EventID=2008 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-47" {
  category                   = "Log Management"
  display_name               = "On which machines and how many times have Windows Firewall Policy settings changed"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-698.id
  name                       = "LogManagement(DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS)_LogManagement|WindowsFireawallPolicySettingsChangedByMachines"
  query                      = "Event | where EventLog == \"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" and EventID == 2008 | summarize AggregatedValue = count() by Computer | limit 500000\r\n// Oql: Type=Event EventLog=\"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" EventID=2008 | measure count() by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_mssql_server" "res-639" {
  administrator_login = "CloudSA407edb68"
  location            = "eastus2"
  name                = "project-demo-sql-server"
  resource_group_name = var.resource_group_name
  version             = "12.0"
  azuread_administrator {
    login_username = "dan@reddog32.com"
    object_id      = "ac63d440-3ec6-4217-8121-c62ca979c3b9"
  }
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_mssql_database" "res-651" {
  name                 = "ProjectDemoSql"
  server_id            = azurerm_mssql_server.res-639.id
  storage_account_type = "Local"
  tags = {
    project = "project-demo"
  }
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-657" {
  database_id            = azurerm_mssql_database.res-651.id
  enabled                = false
  log_monitoring_enabled = false
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-666" {
  database_id            = "/subscriptions/c2a2f372-d73c-426e-985d-aeeb69f56647/resourceGroups/RG-ProjectDemo-${var.environment}/providers/Microsoft.Sql/servers/project-demo-sql-server/databases/master"
  enabled                = false
  log_monitoring_enabled = false
}
resource "azurerm_mssql_server_microsoft_support_auditing_policy" "res-672" {
  enabled                = false
  log_monitoring_enabled = false
  server_id              = azurerm_mssql_server.res-639.id
}
resource "azurerm_mssql_server_transparent_data_encryption" "res-673" {
  server_id = azurerm_mssql_server.res-639.id
}
resource "azurerm_mssql_server_extended_auditing_policy" "res-674" {
  enabled                = false
  log_monitoring_enabled = false
  server_id              = azurerm_mssql_server.res-639.id
}
resource "azurerm_mssql_firewall_rule" "res-675" {
  end_ip_address   = "95.166.23.32"
  name             = "ClientIPAddress_2025-6-23_22-2-26"
  server_id        = azurerm_mssql_server.res-639.id
  start_ip_address = "95.166.23.32"
}
resource "azurerm_mssql_server_security_alert_policy" "res-677" {
  resource_group_name = var.resource_group_name
  server_name         = "project-demo-sql-server"
  state               = "Disabled"
  depends_on = [
    azurerm_mssql_server.res-639
  ]
}
resource "azurerm_mssql_server_vulnerability_assessment" "res-679" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.res-677.id
  storage_container_path          = ""
}
resource "azurerm_service_plan" "res-680" {
  location            = "eastus2"
  name                = "ASP-ProjectDemo-ca6e"
  os_type             = "Windows"
  resource_group_name = var.resource_group_name
  sku_name            = "F1"
  tags = {
    project = "project-demo"
  }
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_windows_web_app" "res-681" {
  app_settings = {
    APPLICATIONINSIGHTS_CONNECTION_STRING      = "InstrumentationKey=d0f5754e-4b06-4d13-a61e-78b7baf34c1f;IngestionEndpoint=https://eastus-8.in.applicationinsights.azure.com/;LiveEndpoint=https://eastus.livediagnostics.monitor.azure.com/;ApplicationId=216cb555-6a68-45cd-8fc9-1e4c8f915d4c"
    ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
    KeyVault__Url                              = "https://projectdemo-${var.environment}.vault.azure.net/"
    XDT_MicrosoftApplicationInsights_Mode      = "default"
  }
  client_affinity_enabled                  = true
  ftp_publish_basic_authentication_enabled = false
  https_only                               = true
  location                                 = "eastus2"
  name                                     = "ProjectDemoApi"
  resource_group_name                      = var.resource_group_name
  service_plan_id                          = azurerm_service_plan.res-680.id
  tags = {
    "hidden-link: /app-insights-conn-string"         = "InstrumentationKey=d0f5754e-4b06-4d13-a61e-78b7baf34c1f;IngestionEndpoint=https://eastus-8.in.applicationinsights.azure.com/;LiveEndpoint=https://eastus.livediagnostics.monitor.azure.com/;ApplicationId=216cb555-6a68-45cd-8fc9-1e4c8f915d4c"
    "hidden-link: /app-insights-instrumentation-key" = "d0f5754e-4b06-4d13-a61e-78b7baf34c1f"
    "hidden-link: /app-insights-resource-id"         = "/subscriptions/c2a2f372-d73c-426e-985d-aeeb69f56647/resourceGroups/RG-ProjectDemo/providers/microsoft.insights/components/ProjectDemo-AppInsights"
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
    ip_restriction_default_action     = ""
    scm_ip_restriction_default_action = ""
  }
}
resource "azurerm_app_service_custom_hostname_binding" "res-695" {
  app_service_name    = "ProjectDemoApi"
  hostname            = "projectdemoapi-hfdecyeea8gyacbg.eastus2-01.azurewebsites.net"
  resource_group_name = var.resource_group_name
  depends_on = [
    azurerm_windows_web_app.res-681
  ]
}
resource "azurerm_monitor_action_group" "res-696" {
  name                = "Application Insights Smart Detection"
  resource_group_name = var.resource_group_name
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
resource "azurerm_application_insights" "res-697" {
  application_type    = "web"
  location            = var.location
  name                = "ProjectDemo-AppInsights"
  resource_group_name = var.resource_group_name
  sampling_percentage = 0
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_log_analytics_workspace" "res-698" {
  location            = var.location
  name                = "DefaultWorkspace-c2a2f372-d73c-426e-985d-aeeb69f56647-EUS"
  resource_group_name = var.resource_group_name
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
