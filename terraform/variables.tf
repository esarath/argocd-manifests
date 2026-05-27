variable "location" {
  type    = string
  default = "eastus"
}

variable "resource_group_name" {
  type    = string
  default = "poc-rg"
}

variable "aks_node_size" {
  type    = string
  default = "Standard_B2s"
}

variable "aks_node_count" {
  type    = number
  default = 1
}
