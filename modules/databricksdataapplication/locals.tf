locals {
  # General locals
  prefix = "${lower(var.prefix)}-${var.environment}-${lower(var.app_name)}"

  # Storage locals
  storage_container_external = {
    for key, value in var.storage_container_ids.external :
    key => {
      storage_account_name   = split("/", var.storage_container_ids.external)[8]
      storage_container_name = reverse(split("/", var.storage_container_ids.external))[0]
    }
  }
  storage_container_raw = {
    storage_account_name   = split("/", var.storage_container_ids.raw)[8]
    storage_container_name = reverse(split("/", var.storage_container_ids.raw))[0]
  }
  storage_container_enriched = {
    storage_account_name   = split("/", var.storage_container_ids.enriched)[8]
    storage_container_name = reverse(split("/", var.storage_container_ids.enriched))[0]
  }
  storage_container_curated = {
    storage_account_name   = split("/", var.storage_container_ids.curated)[8]
    storage_container_name = reverse(split("/", var.storage_container_ids.curated))[0]
  }
  storage_container_workspace = {
    storage_account_name   = split("/", var.storage_container_ids.workspace)[8]
    storage_container_name = reverse(split("/", var.storage_container_ids.workspace))[0]
  }
}

locals {
  databricks_cluster_policy_library_path = var.databricks_cluster_policy_library_path

  # Load file paths
  databricks_cluster_policy_filepaths_json = local.databricks_cluster_policy_library_path == "" ? [] : tolist(fileset(local.databricks_cluster_policy_library_path, "**/*.{json,json.tftpl}"))
  databricks_cluster_policy_filepaths_yaml = local.databricks_cluster_policy_library_path == "" ? [] : tolist(fileset(local.databricks_cluster_policy_library_path, "**/*.{yml,yml.tftpl,yaml,yaml.tftpl}"))

  # Create file variables
  databricks_cluster_policy_file_variables = merge(
    var.databricks_cluster_policy_file_variables,
    var.tags,
    {
      prefix = local.prefix
    }
  )

  # Load file content
  databricks_cluster_policy_definitions_json = {
    for filepath in local.databricks_cluster_policy_filepaths_json :
    filepath => jsondecode(templatefile("${local.databricks_cluster_policy_library_path}/${filepath}", local.databricks_cluster_policy_file_variables))
  }
  databricks_cluster_policy_definitions_yaml = {
    for filepath in local.databricks_cluster_policy_filepaths_yaml :
    filepath => yamldecode(templatefile("${local.databricks_cluster_policy_library_path}/${filepath}", local.databricks_cluster_policy_file_variables))
  }

  # Merge data
  databricks_cluster_policy_definitions_merged = merge(
    local.databricks_cluster_policy_definitions_json,
    local.databricks_cluster_policy_definitions_yaml
  )

  # Databricks cluster policies by name
  databricks_cluster_policy_definitions = {
    for key, value in local.databricks_cluster_policy_definitions_merged :
    try(value.name, "unknown") => value
  }
}
