terraform {
  backend "s3" {
    bucket = "jeevan-s3-demo-tf-remote-backend"
    key    = "tf/state/terraform.tfstate"
    region = "us-east-1"
  }
}
