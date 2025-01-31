variable "azure_subscription_id" {
  type        = string
  description = "Insert de Subscription ID"
}

variable "azure_webapp_location" {
  type        = string
  description = "Insert de location"
  default     = "East US 2"
}