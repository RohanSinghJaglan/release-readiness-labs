provider "aws" {
  region = var.aws_region
}

# Production High-Availability Infrastructure for OrderFlow
# Configured with production-grade instance sizing, security hardening, and traceability

resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type

  # Production security and resilience
  monitoring                  = true
  associate_public_ip_address = false

  root_block_device {
    volume_size           = 50
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name        = "OrderFlow-Production-Server"
    Environment = var.environment
    Application = "OrderFlow"
    Version     = "v2.3.0"
    ManagedBy   = "Terraform"
  }
}
