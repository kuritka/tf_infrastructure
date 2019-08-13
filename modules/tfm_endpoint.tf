
# Create Traffic Manager - West End Point
resource "azurerm_traffic_manager_endpoint" "tm-endpoint" {
  name                = "${local.tme_name}"
  resource_group_name = "${var.shared_rg_name}"
  profile_name        = "${var.tfm_name}"
  type                = "externalEndpoints"
  target              = "${cidrhost(local.gw_private_subnet,5)}"
  endpoint_location   = "${var.region}"
}