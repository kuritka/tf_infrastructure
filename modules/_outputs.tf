output "resource_group" {
    value = "${local.resource_group_name}"
}

output "kubesubneTIT-id" {
    value = "${data.azurerm_subnet.kubesubnet.id}"
}


output "kubesubneTIT-prefix" {
    value = "${data.azurerm_subnet.kubesubnet.address_prefix}"
}