output "resource_group_name" {
  description = "Name of the resource group."
  value       = azurerm_resource_group.main.name
}

output "virtual_network_id" {
  description = "ID of the virtual network."
  value       = azurerm_virtual_network.main.id
}

output "web_subnet_id" {
  description = "ID of the web subnet."
  value       = azurerm_subnet.web.id
}

output "private_subnet_id" {
  description = "ID of the private subnet."
  value       = azurerm_subnet.private.id
}

output "web_vm_id" {
  description = "ID of the Linux web virtual machine."
  value       = azurerm_linux_virtual_machine.web.id
}

output "web_vm_public_ip" {
  description = "Public IP address of the Linux web virtual machine."
  value       = azurerm_public_ip.web.ip_address
}

output "storage_account_name" {
  description = "Name of the storage account."
  value       = azurerm_storage_account.app.name
}