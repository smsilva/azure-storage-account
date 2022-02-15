resource "random_string" "storage_account_id" {
  length      = 3
  min_lower   = 1
  min_numeric = 2
  lower       = true
  special     = false
}
