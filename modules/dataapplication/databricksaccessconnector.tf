module "databricks_access_connector" {
  source = "github.com/chkuewendata/terraform-azurerm-modules//modules/databricksaccessconnector?ref=main"
  providers = {
    azurerm = azurerm
  }

  location                         = var.location
  resource_group_name              = azurerm_resource_group.resource_group_app.name
  tags                             = local.tags
  databricks_access_connector_name = "${local.prefix}-dbac001"
}
