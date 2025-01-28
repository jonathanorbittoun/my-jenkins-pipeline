variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "key_name" {
  description = "Name of the AWS key pair"
  default     = "terraform"  # Replace with your actual key pair name
}
