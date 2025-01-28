provider "aws" {
  # Use environment variables for AWS credentials
  region = var.aws_region
}

# First EC2 instance
resource "aws_instance" "example1" {
  ami           = "ami-05576a079321f21f8"  # Replace with a valid AMI ID
  instance_type = "t2.micro"
  key_name      = var.key_name

  tags = {
    Name = "ExampleInstance1"
  }
}

# Second EC2 instance
resource "aws_instance" "example2" {
  ami           = "ami-05576a079321f21f8"  # Replace with a valid AMI ID
  instance_type = "t2.micro"
  key_name      = var.key_name

  tags = {
    Name = "ExampleInstance2"
  }
}

# Outputs to verify deployed resources
output "instance1_public_ip" {
  description = "Public IP address of the first instance"
  value       = aws_instance.example1.public_ip
}

output "instance2_public_ip" {
  description = "Public IP address of the second instance"
  value       = aws_instance.example2.public_ip
}
