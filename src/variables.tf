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

variable "allow_blob_public_access" {
  type    = string
  default = false
}

variable "tags" {
  default = {}
}
