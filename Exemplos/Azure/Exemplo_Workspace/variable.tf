variable "azure_subscription_id" {
  type        = string
  description = "Subscription ID"
}

variable "resource_group_location" {
  type        = string
  default     = "East US 2"
  description = "Location of the Resource Group"
}

variable "vm_username" {
  type        = string
  description = "The username of the new VM"
}

variable "vm_password" {
  type        = string
  description = "The password of the new VM"
  sensitive   = true
}