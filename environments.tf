#this points to variables
module "instances_we" {
    source                  = "./modules"    
    //custom
    region                   = "${var.primary_region}"
    vnet_addr_prefix         = "${var.virtual_network_address_prefix_we}"

    //common
    client_id                = "${var.client_id}"
    client_secret            = "${var.client_secret}"
    tfm_name                 = "${azurerm_traffic_manager_profile.traffic-manager.name}"
    shared_rg_name           = "${local.shared_rg_name}"
    project_shortcut         = "${var.project_shortcut}"
    environment              = "${var.environment_short}"
    tags                     = "${var.tags}"
}


module "instances_ne" {
   source                  = "./modules"    
    //custom
    region                   = "${var.paired_region}"
    vnet_addr_prefix         = "${var.virtual_network_address_prefix_ne}"

    //common
    client_id                = "${var.client_id}"
    client_secret            = "${var.client_secret}"
    tfm_name                 = "${azurerm_traffic_manager_profile.traffic-manager.name}"
    shared_rg_name           = "${local.shared_rg_name}"
    project_shortcut         = "${var.project_shortcut}"
    environment              = "${var.environment_short}"
    tags                     = "${var.tags}"
}
