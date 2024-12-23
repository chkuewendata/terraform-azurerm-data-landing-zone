locals {
  # General locals
  resource_providers_to_register = [
    "Microsoft.Authorization",
    "Microsoft.Databricks",
    "Microsoft.Insights",
    "Microsoft.KeyVault",
    "Microsoft.ManagedIdentity",
    "Microsoft.Network",
    "Microsoft.Resources",
    "Microsoft.Storage",
  ]

  # Library path locals
  data_application_library_path          = "${path.root}/data-applications"
  databricks_cluster_policy_library_path = "${path.root}/databricks-cluster-policies"
}
