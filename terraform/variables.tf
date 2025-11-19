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

variable "tfstate_rg_name" {
  description = "Ressourcengruppe für Terraform State"
  type        = string
  default     = "cpp-resources"
}

variable "tfstate_sa_name" {
  description = "Storage Account für Terraform State"
  type        = string
  default     = "cppstorageaccount250321"
}

variable "tfstate_container_name" {
  description = "Container für Terraform State"
  type        = string
  default     = "tfstate"
}
