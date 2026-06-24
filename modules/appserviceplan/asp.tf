resource "azurerm_service_plan" "ASP" {
  name                = "test-tf-asp-plan"
  resource_group_name = var.rgname
  location            = var.location
  os_type             = "Windows"
  sku_name            = "B1"
}