provider "aws" {
    access_key = "${AWS_ACCESS_KEY_ID}"
    secret_key = "${AWS_SECRET_ACCESS_KEY}"
    region = "${AWS_DEFAULT_REGION}"
}

resource "aws_vpc" "TEST" {
  cidr_block = "10.0.0.0/16"
}