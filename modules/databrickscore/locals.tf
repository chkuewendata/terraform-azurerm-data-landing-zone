locals {
  # General locals
  prefix = "${lower(var.prefix)}-${var.environment}-core"
  system_schema_names = [
    "access",
    # "billing", # billing system schema can only be enabled by Databricks
    "compute",
    "lakeflow",
    "marketplace",
    "query",
    "serving",
    "storage",
  ]
}
