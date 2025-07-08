variable "resource_group_name_prefix" {
    type        = string
    default     = "RG"
    description = "Prefix."
}
variable "location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}
variable "resource_group_name" {
    type        = string
    default     = "ProjectDemo"
    description = "Resource group"
}
variable "environment" {
    type        = string
    default     = "dev"
    description = "Environment, dev, staging, prod"
}
variable "storage_container_path" {
  description = "Admin password for MSSQL server"
  type        = string
  default     = "https://projectdemostorage.blob.core.windows.net/tfstate"
}
