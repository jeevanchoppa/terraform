provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_id = "ami-0360c520857e3138f"
  instance_type_value = "c7i-flex.large"
  key_name_value = "ultimate_DevOps_project_server_keypair"
}