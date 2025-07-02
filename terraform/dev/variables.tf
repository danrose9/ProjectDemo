variable "prefix" {
    type        = string
    description = "Prefix."
}
variable "location" {
    type        = string
    description = "Azure location"
}
variable "resource_group_name" {
    type        = string
    description = "Resource group"
}
variable "environment" {
    type        = string
    description = "Environment, dev, staging, prod"
}