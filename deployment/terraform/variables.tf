variable "aws_region" {
  type        = string
  description = "AWS deployment region"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Target deployment environment"
  default     = "production"
}

variable "instance_type" {
  type        = string
  description = "Production-grade EC2 instance type with dedicated compute (replaces non-production t2.micro)"
  default     = "t3.large"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Access Key passed securely via environment or secret manager"
  sensitive   = true
  default     = null
}
