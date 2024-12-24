# state.tf
terraform {
  required_version = ">= 1.10.0"
  backend "s3" {
    bucket = "devmds"
    key    = "devenviron"
    region = "us-east-1"
  }
}
