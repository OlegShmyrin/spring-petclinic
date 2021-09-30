variable "vpc_id" {
  type        = "vpc-5387e039"
  description = "Default VPC ID"
}

variable "subnet_id" {
  type        = "subnet-88078fc4"
  description = "Jenkins Subnet"
}

#------------------------------------------------------------------------------#
# Optional variables
#------------------------------------------------------------------------------#

variable "region" {
  type        = "eu-central-1"
  description = "AWS region eu-central-1"
  default     = "eu-central-1"
}