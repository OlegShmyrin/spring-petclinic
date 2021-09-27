
provider "aws" {
   region = "eu-central-1"
  # secret_key = "${AWS_SECRET_ACCESS_KEY}"
  # access_key = "${AWS_ACCESS_KEY_ID}"
}

resource "aws_instance" "AppServer" {
  ami           = "ami-05f7491af5eef733a" # Ubuntu 20
  instance_type = "t2.micro"

  tags = {
    Name = "PetClinicAppSRV"
    Owner = "Oleg Shmyrin"
  }
}

output "public_AppServer_ip" {

  value =  aws_instance.AppServer.public_ip
}

