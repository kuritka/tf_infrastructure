variable "subscription_id" {
    description = "The Azure subscription ID."
}

variable "client_id" {
    description = "The Azure Service Principal app ID."
}

variable "client_secret" {
    description = "The Azure Service Principal password."
}

variable "tenant_id" {
    description = "The Azure Tenant ID."
}

variable "project_shortcut" {
  description = "project shortcut"
  default = "edt"
}


variable environment_short { 
    description="Environment shortut used for naming"
    default="tit"
}

variable "primary_region" {
    description = "The Azure region to create things in."
    default = "westeurope"
}

variable "paired_region" {
    description = "The Azure region to create things in."
    default = "northeurope"
}


variable "tags" {
  type = "map"
  default = {
    source = "terraform"
    creator = "aq446"
    owner = "aq446"
    application = "edt"
    purpose = "tit+bat & SIM  demo. demonstrates architecture in s_corpsys_sim"
    environment = "sendbox test"
  }
}

variable "resource_group_name" {
  description = "Name of the resource group already created."
  default="rg-mk"
}


variable "virtual_network_address_prefix_we" { 
    description = "vnet prefix."
    default="10.121.36.0/22"
}

variable "virtual_network_address_prefix_ne" { 
    description = "vnet prefix."
    default="10.121.40.0/22"
}


variable "db_admin_username" {
  description = "Postgre admin name in .tfvars"
}


variable "db_admin_password" {
  description = "Postgre admin password in .tfvars"
}


