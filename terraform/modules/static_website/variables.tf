variable "resource_group_name" {
  description = "Name der Ressourcengruppe"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "sa_name" {
  description = "Name des Storage Accounts"
  type        = string
}

variable "tfstate_container_name" {
  description = "Name des Containers für Terraform State"
  type        = string
}