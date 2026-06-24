resource "azurerm_mssql_server" "dbserver" {
  name = "tf-test-db-server"
  resource_group_name = var.rgname
  location = var.location
  version = "12.0"
  administrator_login = "sureshadmin"
  administrator_login_password = "Suresh12345"
  public_network_access_enabled = false
  
}
resource "azurerm_mssql_database" "db" {
  name      = "tf-test-db"
  server_id = azurerm_mssql_server.dbserver.id

}