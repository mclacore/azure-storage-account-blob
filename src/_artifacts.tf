resource "massdriver_artifact" "azure_storage_account_blob" {
  field                = "azure_storage_account_blob"
  provider_resource_id = azurerm_storage_account.main.id
  name                 = "Azure Blob Storage Account ${var.md_metadata.name_prefix}"
  artifact = jsonencode(
    {
      data = {
        infrastructure = {
          ari               = azurerm_storage_account.main.id
          connection_string = azurerm_storage_account.main.primary_connection_string
        }
        authentication = {
          primary_access_key = azurerm_storage_account.main.primary_access_key
        }
      }
      specs = {
        azure = {
          region = azurerm_resource_group.main.location
        }
      }
    }
  )
}
