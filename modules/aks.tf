resource "azurerm_kubernetes_cluster" "edt-aks-cluster" {

  name                = "${local.aks_name}"
  location            = "${var.region}"
  resource_group_name = "${local.resource_group_name}"
  dns_prefix          = "aks"

  addon_profile {
     http_application_routing {
       enabled = false
     }
   }

   role_based_access_control {
     enabled = false
   }

  agent_pool_profile {
    name           = "agentpool"
    os_type        = "Linux"
    count           = "1"
    vm_size         = "Standard_A2_v2"
    os_disk_size_gb = 30

    vnet_subnet_id  = "${data.azurerm_subnet.kubesubnet.id}"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  network_profile {
    network_plugin = "kubenet"
  }

  tags = "${merge(var.tags, map(
            "Name", "${local.aks_name}",
          ))}"
}