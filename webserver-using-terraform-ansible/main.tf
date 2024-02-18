provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "server1" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  key_name = var.key_name
  security_groups = var.security_groups
  
  tags = {
    Name = "server1"
  }
  user_data = base64encode(file("userdata.sh"))
}
