# # ----------------------------------------------------------------------------------------------------------------------
# # https://docs.microsoft.com/en-us/azure/postgresql/concepts-high-availability
# # Azure gurantees high availability with postgressql database
# # Terraform yet to include read replica support
# # https://github.com/terraform-providers/terraform-provider-azurerm/issues/2819
# #
# #
# # ----------------------------------------------------------------------------------------------------------------------

# #########################################################################
# #  Postgres SQL server
# #########################################################################
# resource "azurerm_postgresql_server" "edt-postgres-server" {
#   name                         = "pgsql-${local.suffix}"
#   resource_group_name          = "${local.shared_rg_name}"
#   location                     = "${var.primary_region}"
#   version                      = "10.0"
#   administrator_login          = "${var.db_admin_username}"
#   administrator_login_password = "${var.db_admin_password}"


# //https://docs.microsoft.com/en-us/azure/postgresql/concepts-pricing-tiers#compute-generations-vcores-and-memory
#   sku {
#     name     = "GP_MO_Gen4_2"
#     family   = "Gen4"
#     tier     = "GeneralPurpose"
#     capacity = 2
#   }

#   ssl_enforcement = "Enabled"

#   storage_profile {
#     storage_mb = 5120
#     backup_retention_days = 7
#     geo_redundant_backup  = "Enabled"
#   }


#   tags = "${merge(var.tags, map(
#         "Name", "pgsql-${local.suffix}",
#     ))}"
# }


# #########################################################################
# # Postgres Database
# #########################################################################

# resource "azurerm_postgresql_database" "edt-database" {
#   name                = "db-${local.suffix}"
#   resource_group_name = "${local.shared_rg_name}"
#   server_name         = "${azurerm_postgresql_server.edt-postgres-server.name}"
#   charset             = "UTF8"
#   //has to be changed after I get list of postgre 10 collations 
#   //to equivalent of this: SQL_Latin1_General_CP1_CI_AS
#   collation           = "English_United Kingdom.1252"
# }
