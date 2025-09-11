provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
  instance_type = "t3.micro"
  ami = "ami-0360c520857e3138f"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "jeevan-s3-demo-tf-remote-backend"

    tags = {
      Name = "jeevan-s3-demo-tf-remote-backend"
    }
  
}