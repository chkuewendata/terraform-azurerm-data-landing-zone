module "databricks_access_connector_engineering" {
  source = "github.com/chkuewendata/terraform-azurerm-modules//modules/databricksaccessconnector?ref=main"
  providers = {
    azurerm = azurerm
  }

  location                         = var.location
  resource_group_name              = azurerm_resource_group.resource_group_engineering.name
  tags                             = var.tags
  databricks_access_connector_name = "${local.prefix}-eng-dbac001"
}
