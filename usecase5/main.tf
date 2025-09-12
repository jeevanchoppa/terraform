provider "aws" {
    region = "us-east-1"

}

provider "vault" {
  address = "http://<>:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = ""
      secret_id = ""
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "" // change it according to your mount
  name  = "" // change it according to your secret
}

resource "aws_instance" "ec2_instance" {
  ami = "ami-0360c520857e3138f"
  instance_type = "t3.micro"

  tags = {
    secret = data.vault_kv_secret_v2.example.data[""]
  }
}