variable "project_name" {
  description = "Name used to identify network resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR ranges for public subnets"
  type        = list(string)
  default     = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "availability_zones" {
  description = "Availability Zones for public subnets"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}
variable "private_subnet_cidrs" {
  description = "CIDR ranges for private subnets"
  type        = list(string)
  default     = ["10.20.101.0/24", "10.20.102.0/24"]
}
