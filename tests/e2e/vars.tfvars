# General variables
location    = "westus3"
environment = "dev"
prefix      = "ckdlz01"
tags        = {}

# Service
data_platform_subscription_ids                   = []
data_application_library_path                    = "./data-applications"
data_application_file_variables                  = {}
databricks_cluster_policy_library_path           = "./databricks-cluster-policies"
databricks_cluster_policy_file_variables         = {}
databricks_account_id                            = "1745545a-55c6-40c6-bccb-24f60b1b24b6"
databricks_network_connectivity_config_name      = "ncc-westus3-test"
databricks_compliance_security_profile_standards = []
databricks_workspace_binding_catalog             = {}
fabric_capacity_details = {
  enabled      = true
  admin_emails = []
  sku          = "F2"
}

# HA/DR variables
zone_redundancy_enabled = false

# Logging variables
log_analytics_workspace_id = "/subscriptions/64d97042-a8b5-4033-b2d1-4bbda40c8a91/resourceGroups/chk-dev-logging-rg/providers/Microsoft.OperationalInsights/workspaces/chk-dev-log001"

# Identity variables
service_principal_name_terraform_plan = "chk-dev-uai001-dlz-tfdeploy"

# Network variables
vnet_id        = "/subscriptions/03da348d-7793-48f5-8985-399e90218d0c/resourceGroups/chk-dev-networking-rg/providers/Microsoft.Network/virtualNetworks/spoke-chk-dev-vnet002"
nsg_id         = "/subscriptions/03da348d-7793-48f5-8985-399e90218d0c/resourceGroups/chk-dev-networking-rg/providers/Microsoft.Network/networkSecurityGroups/spoke-chk-dev-vnet001-default-nsg-westus3"
route_table_id = "/subscriptions/03da348d-7793-48f5-8985-399e90218d0c/resourceGroups/chk-dev-networking-rg/providers/Microsoft.Network/routeTables/chk-dev-default-rt001"
subnet_cidr_ranges = {
  storage_subnet                        = "10.2.0.0/27"
  fabric_subnet                         = "10.2.0.32/27"
  databricks_engineering_private_subnet = "10.2.0.128/25"
  databricks_engineering_public_subnet  = "10.2.1.0/25"
}

# DNS variables
#private_dns_zone_id_blob              = "/subscriptions/e82c5267-9dc4-4f45-ac13-abdd5e130d27/resourceGroups/chk-dev-privatedns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
#private_dns_zone_id_dfs               = "/subscriptions/e82c5267-9dc4-4f45-ac13-abdd5e130d27/resourceGroups/chk-dev-privatedns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.dfs.core.windows.net"
#private_dns_zone_id_vault             = "/subscriptions/e82c5267-9dc4-4f45-ac13-abdd5e130d27/resourceGroups/chk-dev-privatedns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net"
#private_dns_zone_id_databricks        = "/subscriptions/e82c5267-9dc4-4f45-ac13-abdd5e130d27/resourceGroups/chk-dev-privatedns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.azuredatabricks.net"
#private_dns_zone_id_cognitive_account = "/subscriptions/e82c5267-9dc4-4f45-ac13-abdd5e130d27/resourceGroups/chk-dev-privatedns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.cognitiveservices.azure.com"
#private_dns_zone_id_open_ai           = "/subscriptions/e82c5267-9dc4-4f45-ac13-abdd5e130d27/resourceGroups/chk-dev-privatedns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.openai.azure.com"
#private_dns_zone_id_data_factory      = "/subscriptions/e82c5267-9dc4-4f45-ac13-abdd5e130d27/resourceGroups/chk-dev-privatedns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.datafactory.azure.net"
#private_dns_zone_id_search_service    = "/subscriptions/e82c5267-9dc4-4f45-ac13-abdd5e130d27/resourceGroups/chk-dev-privatedns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.search.windows.net"

# Customer-managed key variables
customer_managed_key = null
