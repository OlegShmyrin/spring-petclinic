
provider "aws" {
   region = "eu-central-1"
  # secret_key = "${AWS_SECRET_ACCESS_KEY}"
  # access_key = "${AWS_ACCESS_KEY_ID}"
   # version = "~> 2.70"
}

resource "aws_instance" "AppServer" {
  ami           = "ami-05f7491af5eef733a" # Ubuntu 20
  instance_type = "t2.micro"

  tags = {
    Name = "PetClinicAppSRV"
    Owner = "Oleg Shmyrin"
    key_name      = aws_key_pair.generated_key.terraform-key-pair
  }
}

variable "generated_key_name" {
  type        = string
  default     = "terraform-key-pair"
  description = "Key-pair generated by Terraform"
}

resource "tls_private_key" "PetClinic_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.generated_key_name
  public_key = tls_private_key.PetClinic_key.public_key_openssh

  provisioner "local-exec" {    # Generate "terraform-key-pair.pem" in current directory
    command = "echo '${tls_private_key.PetClinic_key.private_key_pem}' > ./'${var.generated_key_name}'.pem"
  }

  provisioner "local-exec" {
    command = "chmod 400 ./'${var.generated_key_name}'.pem"
  }
}
