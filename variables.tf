variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"

  validation {
    condition = contains(
      ["dev", "staging", "production"],
      var.environment
    )
    error_message = "Environment must be dev, staging, or production."
  }
}

variable "allowed_environments" {
  description = "Environments available for deployment"
  type        = list(string)
  default     = ["dev", "staging", "production"]
}

variable "instance_count" {
  description = "Number of instances for practice"
  type        = number
  default     = 2
}

variable "monitoring_enabled" {
  description = "Whether monitoring is enabled"
  type        = bool
  default     = true
}

variable "project_tags" {
  description = "Tags for the project"
  type        = map(string)

  default = {
    Environment = "dev"
    Project     = "terraform-practice"
    ManagedBy   = "Terraform"
  }
}
variable "app_config" {
  description = "Application configuration"
  type = object({
    name       = string
    port       = number
    monitoring = bool
  })

  default = {
    name       = "devops-app"
    port       = 9090
    monitoring = true
  }
}

variable "dev_app_port" {
  description = "Port for the development app"
  type        = number
  default     = 8080
}

variable "staging_app_port" {
  description = "Port for the staging app"
  type        = number
  default     = 9090
}
