# Informations sur le groupe de ressources
output "resource_group_name" {
    value = azurerm_resource_group.katia.name
}

output "resource_group_location" {
    value = azurerm_resource_group.katia.location
}

# Informations sur la VM
output "vm_name" {
    value = azurerm_virtual_machine.katia_vm.name
}

output "vm_public_ip" {
    value = azurerm_public_ip.katia_ip.ip_address
}

output "vm_private_ip" {
    value = azurerm_network_interface.katia_nic.private_ip_address
}

output "ssh_connection_string" {
    value = "ssh ${var.admin_username}@${azurerm_public_ip.katia_ip.ip_address}"
}

# Informations sur le stockage
output "storage_account_name" {
    value = azurerm_storage_account.katia_storage.name
}

output "primary_blob_endpoint" {
    value = azurerm_storage_account.katia_storage.primary_blob_endpoint
}

output "storage_container_name" {
    value = azurerm_storage_container.katia_container.name
}

# Informations sur PostgreSQL
output "postgresql_server_fqdn" {
    value = azurerm_postgresql_server.katia_postgresql.fqdn
}

output "postgresql_connection_string" {
    value     = "postgresql://${var.postgresql_admin_username}@${azurerm_postgresql_server.katia_postgresql.name}:${var.postgresql_admin_password}@${azurerm_postgresql_server.katia_postgresql.fqdn}:5432/${var.postgresql_db_name}"
    sensitive = true
}

# URL de l'application Flask
output "application_url" {
    value = "http://${azurerm_public_ip.katia_ip.ip_address}:5000"
}
