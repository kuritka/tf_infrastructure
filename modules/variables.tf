
variable "vnet_addr_prefix" {}

variable "region" {}



variable "client_id" {}

variable "client_secret" {}

variable "project_shortcut" {}

variable "tags" {}

variable "tfm_name" {}

variable "shared_rg_name" {}

variable environment {}

variable "newbit_size" {
  description = "Map the friendly name to our subnet bit mask"
  type        = "map"

  default = {
    //8
    size_8 = "7"  
    //16
    size_16 = "6"
    //32
    size_32  = "5"
    //64
    size_64 = "4"
    //128
    size_128  = "3"
  }
}




