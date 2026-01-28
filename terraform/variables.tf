variable "location" {
  description = "Azure region for all resources"
  default     = "eastus"
}

variable "prefix" {
  description = "Prefix for all resource names"
  default     = "ppowar"
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  default     = "Standard_DC4s_v3"
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  default     = 2
}
