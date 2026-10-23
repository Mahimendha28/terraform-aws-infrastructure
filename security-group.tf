resource "aws_security_group" "terraform_ssh_demo" {
  name        = "terraform-ssh-demo"
  description = "Terraform security group practice"
  vpc_id      = "vpc-0b587758120a8d53f"

  ingress {
    description = "SSH from trusted client IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    # Replace this placeholder before applying.
    cidr_blocks = ["3.108.53.16/32"]
  }

  egress {
    description = "Allow outbound IPv4 traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "terraform-ssh-demo"
    ManagedBy = "Terraform"
    Purpose   = "Learning"
  }
}
