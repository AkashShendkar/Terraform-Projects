terraform {
  backend "s3" {
    bucket         = "terraform-state-akash12"
    key            = "tfs/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "tf-lock"
  }
}
