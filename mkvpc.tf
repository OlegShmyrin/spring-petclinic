
provider "aws" {
   region = "eu-central-1"
   secret_key = "${AWS_SECRET_ACCESS_KEY}"
   access_key = "${AWS_ACCESS_KEY_ID}"
}

resource "aws_vpc" "TEST" {
  cidr_block = "10.0.0.0/16"
}