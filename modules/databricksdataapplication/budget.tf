resource "databricks_budget" "budget" {
  count = var.budget == null ? 0 : 1

  provider = databricks.account

  display_name = "${local.prefix}-budget"

  alert_configurations {
    quantity_threshold = var.budget.categories.databricks
    quantity_type      = "LIST_PRICE_DOLLARS_USD"
    time_period        = "MONTH"
    trigger_type       = "CUMULATIVE_SPENDING_EXCEEDED"
    action_configurations {
      action_type = "EMAIL_NOTIFICATION"
      target      = var.budget.endpoints.email.email_address
    }
  }
  filter {
    workspace_id {
      operator = "IN"
      values = [
        var.databricks_workspace_workspace_id
      ]
    }
  }
}

resource "databricks_budget_policy" "budget_policy" {
  provider = databricks.account

  policy_name = "${local.prefix}-budget"

  custom_tags = [
    for key, value in local.tags :
    {
      key   = key
      value = value
    }
  ]
}
