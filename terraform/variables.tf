variable "rg_name" {
  description = "Name der Ressourcengruppe"
  type        = string
  default     = "cpp-resources"
}

variable "sa_name" {
  description = "Name des Storage Accounts"
  type        = string
  default     = "cppstorageaccount250321"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "germanywestcentral"
}