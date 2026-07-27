variable "rg_sandbox" {
  type        = map(any)
  description = "Resource Group details for sandbox"
}

variable "vnet_sandbox" {
  type        = map(any)
  description = "Virtual Network details for sandbox"
}

variable "subnet_sandbox" {
  type        = map(any)
  description = "Subnet details for sandbox (frontend, backend, database)"
}

variable "pip_sandbox" {
  type        = map(any)
  description = "Public IP details for sandbox"
  default     = {}
}

variable "nsg_sandbox" {
  type        = map(any)
  description = "Network Security Groups details for sandbox"
  default     = {}
}

variable "vm_sandbox" {
  type        = map(any)
  description = "Virtual Machines details for sandbox"
  default     = {}
}

variable "appgw_sandbox" {
  type        = map(any)
  description = "Application Gateway details for sandbox"
  default     = {}
}
