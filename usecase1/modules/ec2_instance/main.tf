provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "my_instance" {
  ami = var.ami_id
  instance_type = var.instance_type_value
  key_name = var.key_name_value
  #subnet_id = var.subnet_id_value
}