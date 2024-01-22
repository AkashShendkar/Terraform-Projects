provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "Server1" {
  instance_type = "t3.micro"
  ami = "ami-0d980397a6e8935cd"
  subnet_id = "subnet-02d30684bff43cd86"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "terraform-state-akash12"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "tf-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
