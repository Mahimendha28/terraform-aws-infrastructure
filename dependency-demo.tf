resource "terraform_data" "network_config" {
  input = {
    name = "demo-network"
    type = "security-group-placeholder"
  }
}

resource "terraform_data" "app_config_demo" {
  input = {
    name = "demo-app"
  }

  depends_on = [
    terraform_data.network_config
  ]
}
