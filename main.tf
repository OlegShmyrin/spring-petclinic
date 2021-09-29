
provider "aws" {
   region = "eu-central-1"
  # secret_key = "${AWS_SECRET_ACCESS_KEY}"
  # access_key = "${AWS_ACCESS_KEY_ID}"
   version = "~> 3.0"
}

resource "aws_instance" "AppServer" {
  ami           = "ami-05f7491af5eef733a" # Ubuntu 20
  instance_type = "t2.micro"

  tags = {
    Name = "PetClinicAppSRV"
    Owner = "Oleg Shmyrin"
  }
}