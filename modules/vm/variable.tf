variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine."
  type        = string
 
  
}

variable "location" {
  description = "The Azure region in which to create the virtual machine."
  type        = string

}


variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string

}

variable "admin_username" {
    description = "The admin username for the virtual machine."
    type        = string

}

variable "admin_password" {
    description = "The admin password for the virtual machine."
    type        = string

}
