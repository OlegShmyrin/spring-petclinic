provider "aws" {
   # access_key = "${var.AWS_ACCESS_KEY_ID}"
   # secret_key = "${var.AWS_SECRET_ACCESS_KEY}"
   # region = "${var.AWS_DEFAULT_REGION}"
}

resource "aws_vpc" "TEST" {
  cidr_block = "10.0.0.0/16"
}