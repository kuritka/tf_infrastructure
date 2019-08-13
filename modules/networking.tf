
resource "azurerm_resource_group" "rg" {
    name = "${local.resource_group_name}"
    location =  "${var.region}"
}

data "azurerm_subnet" "kubesubnet" {
   name                 = "${local.aks_subnet_name}"
   virtual_network_name = "${local.vnet_name}"
   resource_group_name  = "${local.resource_group_name}"
   depends_on           = ["azurerm_virtual_network.vnet"]
 }


data "azurerm_subnet" "appgwsubnetprivate" {
   name                 = "${local.gw_private_subnet_name}"
   virtual_network_name = "${local.vnet_name}"
   resource_group_name  = "${local.resource_group_name}"
   depends_on           = ["azurerm_virtual_network.vnet"]
 }

resource "azurerm_virtual_network" "vnet" {
   name                = "${local.vnet_name}"
   location            = "${var.region}"
   resource_group_name = "${local.resource_group_name}"
   address_space       = ["${var.vnet_addr_prefix}"]

   //TIT+BAT

   //AKS WE 9+1, AKS NE 9+1, 5 adresses occupied by Azure, 
   //remaining 17 adresses used for cluster's reinstall and reserve for new nodes  
   subnet {
      name           = "${local.aks_subnet_name}"
      address_prefix = "${local.aks_subnet}"
   }

   subnet {
      name           = "${local.gw_public_subnet_name}"
      address_prefix = "${local.gw_public_subnet}"
   }

   subnet {
      name           = "${local.gw_private_subnet_name}"
      address_prefix = "${local.gw_private_subnet}"
   }

   tags = "${var.tags}"
}
