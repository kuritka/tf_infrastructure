

# //Remove temporarily to allow connectivity from outside subnet
# #########################################################################
# #  Postgres SQL server virtual network rule
# #########################################################################
# resource "azurerm_postgresql_virtual_network_rule" "edt-postgres-server-vnet-rule" {
#   name                                 = "vnet-rule-pgsql-${local.suffix}"
#   resource_group_name                  = "${var.shared_rg_name}"
#   server_name                          = "${var.name}"
#   ignore_missing_vnet_service_endpoint = true
#   subnet_id                            = azurerm_subnet.edt-aks-subnet.id
# }
