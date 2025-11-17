output "website_url" {
  value       = azurerm_storage_account.cpp_sa.primary_web_endpoint
  description = "URL der bereitgestellten statischen Website"
}