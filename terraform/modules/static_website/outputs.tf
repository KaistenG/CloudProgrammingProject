output "website_url" {
  value       = azurerm_storage_account.sa.primary_web_endpoint
  description = "URL der bereitgestellten statischen Website"
}

output "storage_account_name" {
  value       = azurerm_storage_account.sa.name
  description = "Name des Storage Accounts"
}