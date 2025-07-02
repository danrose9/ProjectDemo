provider "azurerm" {
  features {
  }
  subscription_id                 = "c2a2f372-d73c-426e-985d-aeeb69f56647"
  environment                     = "public"
  use_msi                         = false
  use_cli                         = true
  use_oidc                        = false
  resource_provider_registrations = "none"
}
