# Resource group role assignments
resource "azurerm_role_assignment" "role_assignment_resource_group_app_reader_developer" {
  count = var.developer_group_name == "" ? 0 : 1

  description          = "Role assignment to app resource group."
  scope                = azurerm_resource_group.resource_group_app.id
  role_definition_name = "Reader"
  principal_id         = one(data.azuread_group.group_developer[*].object_id)
  principal_type       = "Group"
}

resource "azurerm_role_assignment" "role_assignment_resource_group_app_monitoring_reader_developer" {
  count = var.developer_group_name == "" ? 0 : 1

  description          = "Role assignment to app resource group."
  scope                = azurerm_resource_group.resource_group_app_monitoring.id
  role_definition_name = "Reader"
  principal_id         = one(data.azuread_group.group_developer[*].object_id)
  principal_type       = "Group"
}

resource "azurerm_role_assignment" "role_assignment_resource_group_storage_reader_developer" {
  count = var.developer_group_name == "" ? 0 : 1

  description          = "Role assignment to storage resource group."
  scope                = "${data.azurerm_subscription.current.id}/resourceGroups/${split("/", var.storage_account_ids.external)[4]}"
  role_definition_name = "Reader"
  principal_id         = one(data.azuread_group.group_developer[*].object_id)
  principal_type       = "Group"
}

# Key vault role assignments
resource "azurerm_role_assignment" "role_assignment_key_vault_secrets_user_developer" {
  count = var.developer_group_name == "" ? 0 : 1

  description          = "Role assignment to key vault to read secrets."
  scope                = module.key_vault.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = one(data.azuread_group.group_developer[*].object_id)
  principal_type       = "Group"
}

# Databricks role assignments
resource "azurerm_role_assignment" "role_assignment_databricks_workspace_reader_developer" {
  count = var.developer_group_name == "" ? 0 : 1

  description          = "Role assignment to databricks workspace."
  scope                = var.databricks_workspace_details["engineering"].id
  role_definition_name = "Reader"
  principal_id         = one(data.azuread_group.group_developer[*].object_id)
  principal_type       = "Group"
}

# AI service role assignments
resource "azurerm_role_assignment" "role_assignment_ai_service_developer" {
  for_each = var.developer_group_name == "" ? {} : var.ai_services

  description          = "Role assignment to the ai services."
  scope                = module.ai_service[each.key].cognitive_account_id
  role_definition_name = local.ai_service_kind_role_map_write[each.value.kind]
  principal_id         = one(data.azuread_group.group_developer[*].object_id)
  principal_type       = "Group"
}

# Data factory role assignments
resource "azurerm_role_assignment" "role_assignment_data_factory_data_factory_contributor_developer" {
  count = var.developer_group_name == "" ? 0 : 1

  description          = "Role assignment to data factory."
  scope                = one(module.data_factory[*].data_factory_id)
  role_definition_name = "Data Factory Contributor"
  principal_id         = one(data.azuread_group.group_developer[*].object_id)
  principal_type       = "Group"
}

# Storage role assignments
resource "azurerm_role_assignment" "role_assignment_storage_container_external_blob_data_conributor_developer" {
  count = var.developer_group_name == "" ? 0 : 1

  description          = "Role assignment to the external storage container."
  scope                = azurerm_storage_container.storage_container_external.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = one(data.azuread_group.group_developer[*].object_id)
  principal_type       = "Group"
}

resource "azurerm_role_assignment" "role_assignment_storage_container_raw_blob_data_conributor_developer" {
  count = var.developer_group_name == "" ? 0 : 1

  description          = "Role assignment to the raw storage container."
  scope                = azurerm_storage_container.storage_container_raw.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = one(data.azuread_group.group_developer[*].object_id)
  principal_type       = "Group"
}

resource "azurerm_role_assignment" "role_assignment_storage_container_enriched_blob_data_conributor_developer" {
  count = var.developer_group_name == "" ? 0 : 1

  description          = "Role assignment to the enriched storage container."
  scope                = azurerm_storage_container.storage_container_enriched.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = one(data.azuread_group.group_developer[*].object_id)
  principal_type       = "Group"
}

resource "azurerm_role_assignment" "role_assignment_storage_container_curated_blob_data_conributor_developer" {
  count = var.developer_group_name == "" ? 0 : 1

  description          = "Role assignment to the curated storage container."
  scope                = azurerm_storage_container.storage_container_curated.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = one(data.azuread_group.group_developer[*].object_id)
  principal_type       = "Group"
}

resource "azurerm_role_assignment" "role_assignment_storage_container_workspace_blob_data_conributor_developer" {
  count = var.developer_group_name == "" ? 0 : 1

  description          = "Role assignment to the workspace storage container."
  scope                = azurerm_storage_container.storage_container_workspace.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = one(data.azuread_group.group_developer[*].object_id)
  principal_type       = "Group"
}
