locals {
    suffix = "${var.project_shortcut}-${var.environment}-${var.region}"
    vnet_name = "vnet-${local.suffix}"

    resource_group_name = "rg-${local.suffix}"

    tme_name = "tme-${local.suffix}"
    
    aks_name = "aks-${local.suffix}"

    aks_subnet = "${cidrsubnet(var.vnet_addr_prefix,  lookup(var.newbit_size,"size_32"),0)}"

    aks_subnet_name = "sn-aks-${local.suffix}"

    aks_public_endpoint_private_ip = "${cidrhost(local.aks_subnet, 5)}"

    gw_name = "agw-${local.suffix}"

    gw_public_subnet = "${cidrsubnet(var.vnet_addr_prefix,  lookup(var.newbit_size,"size_16"),2)}"

    gw_public_subnet_name = "sn-agw-public-${local.suffix}"

    gw_private_subnet = "${cidrsubnet(var.vnet_addr_prefix,  lookup(var.newbit_size,"size_16"),3)}"

    gw_private_subnet_name = "sn-agw-private-${local.suffix}"

    backend_address_pool_name      = "${local.vnet_name}-beap"
    frontend_port_name             = "${local.vnet_name}-feport"
    frontend_ip_configuration_name = "${local.vnet_name}-feip"
    http_setting_name              = "${local.vnet_name}-be-htst"
    listener_name                  = "${local.vnet_name}-httpslstn"
    request_routing_rule_name      = "${local.vnet_name}-rqrt"

    //todo: use vault instead providing certificate...
    wildcard_cert1_domain_cert_data = "${filebase64("./modules/certificates/public-test-emission.corpsys.test.ams.azu.dbgcloud.io.pfx")}"
}