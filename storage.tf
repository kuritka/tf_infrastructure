#########################################################################
# Storage Account
#########################################################################
resource "azurerm_storage_account" "edt-storage" {
  name                     = "${local.fs_name}"
  resource_group_name      = "${local.shared_rg_name}"
  location                 = "${var.primary_region}"
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "GRS"

  enable_file_encryption   = true
  enable_https_traffic_only  = true

  tags = "${merge(var.tags, map(
            "Name", "${local.fs_name}",
          ))}"
}


#########################################################################
# Storage Files
#########################################################################


resource "azurerm_storage_share" "preview" {
  name                 = "preview"
  resource_group_name  = "${local.shared_rg_name}"
  storage_account_name = "${azurerm_storage_account.edt-storage.name}"
  quota                = 10
}

resource "azurerm_storage_share" "globalnotes" {
  name                 = "globalnotes"
  resource_group_name  = "${local.shared_rg_name}"
  storage_account_name = "${azurerm_storage_account.edt-storage.name}"
  quota                = 10
}

resource "azurerm_storage_share" "signatures" {
  name                 = "signatures"
  resource_group_name  = "${local.shared_rg_name}"
  storage_account_name = "${azurerm_storage_account.edt-storage.name}"
  quota                = 1
}

resource "azurerm_storage_share" "upload" {
  name                 = "upload"
  resource_group_name  = "${local.shared_rg_name}"
  storage_account_name = "${azurerm_storage_account.edt-storage.name}"
  quota                = 10
}
