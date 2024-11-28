locals {
  # General locals
  prefix = "${lower(var.prefix)}-${lower(var.app_name)}-${var.environment}"

  # Storage locals
  storage_container_external = {
    storage_account_name = split("/", var.storage_container_ids.external)[8]
    storage_container_name = reverse(split("/", var.storage_container_ids.external))[0]
  }
  storage_container_raw = {
    storage_account_name = split("/", var.storage_container_ids.raw)[8]
    storage_container_name = reverse(split("/", var.storage_container_ids.raw))[0]
  }
  storage_container_enriched = {
    storage_account_name = split("/", var.storage_container_ids.enriched)[8]
    storage_container_name = reverse(split("/", var.storage_container_ids.enriched))[0]
  }
  storage_container_curated = {
    storage_account_name = split("/", var.storage_container_ids.curated)[8]
    storage_container_name = reverse(split("/", var.storage_container_ids.curated))[0]
  }
  storage_container_workspace = {
    storage_account_name = split("/", var.storage_container_ids.workspace)[8]
    storage_container_name = reverse(split("/", var.storage_container_ids.workspace))[0]
  }
}
