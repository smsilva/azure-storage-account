variable "name" {
  type = string
}

variable "resource_group" {
  type = object({
    id       = string
    name     = string
    location = string
  })
}

variable "container_name" {
  type        = string
  description = "Storage Container Name"
  default     = "terraform"
}

variable "account_tier" {
  type        = string
  description = "Storage Account Tier"
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "Account Replication Type"
  default     = "LRS"
}

variable "container_access_type" {
  type        = string
  description = "Container Access Type"
  default     = "private"
}

variable "tags" {
  default = {}
}
