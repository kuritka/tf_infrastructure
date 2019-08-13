#terraform state or file locking issues, Storage must be created automatically
terraform {
    backend "azurerm" {
        storage_account_name = "tfmkbackend" # Use your own unique name here
        container_name       = "backendblob" # Use your own container name here
        key                  = "prod.terraform.tfstate" # Add a name to the state file
        resource_group_name  = "rg-terraform-mk" # Use your own container name here
    }
}
