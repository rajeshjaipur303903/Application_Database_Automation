variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.2.0/24"
}

variable "key_name" {
  description = "The name of the SSH key pair"
}

variable "ami" {
  description = "AMI ID for the EC2 instances"
  default     = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
}
