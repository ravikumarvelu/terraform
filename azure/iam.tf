resource "azurerm_role_assignment" "vm_blob_reader" {
  scope                = azurerm_storage_account.app.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azurerm_linux_virtual_machine.web.identity[0].principal_id
}