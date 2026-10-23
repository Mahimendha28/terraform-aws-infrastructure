resource "terraform_data" "app" {
  input = {
    name        = var.app_name
    port        = var.app_port
    environment = var.environment
  }
}
