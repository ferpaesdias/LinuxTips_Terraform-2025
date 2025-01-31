variable "azure_subscription_id" {
  type        = string
  description = "Insert de Subscription ID"
}

variable "azure_vm_admin_password" {
  type        = string
  description = "Insert de Password"
  sensitive   = true
}

variable "azure_vm_location" {
  type        = string
  description = "Insert de location"
  default     = "East US 2"
}
