provider "aws" {
  region = "ap-south-1"  
  }

# Create a VPC for the ALB
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "myvpc"
  }
}
# Create a subnet for the ALB
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"  
    map_public_ip_on_launch = true
}
resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b" 
  map_public_ip_on_launch = true
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.RT.id
}

# Create a security group for the ALB
resource "aws_security_group" "LBSG" {
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "LBSG"
  }
}

# Create an ALB
resource "aws_lb" "myalb" {
  name               = "myalb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.LBSG.id]
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  enable_http2       = true
  tags = {
    Name = "WebLB"
  }
}


resource "aws_lb_listener" "lblistener2" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = 80
  protocol          = "HTTP"
  
  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type             = "forward"
    }
}


resource "aws_lb_target_group" "tg2" {
  name     = "myTG1"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = aws_vpc.myvpc.id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

resource "aws_lb_target_group_attachment" "attach11" {
  target_group_arn = aws_lb_target_group.tg2.arn
  target_id        = aws_instance.webserver1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach12" {
  target_group_arn = aws_lb_target_group.tg2.arn
  target_id        = aws_instance.webserver2.id
  port             = 80
}

# Create a Route 53 record for the ALB
resource "aws_route53_record" "record1" {
  zone_id = "Z00973843STB9C81BL4YH"  
  name    = "www.akashshendkar.link"   
  type    = "A"

  alias {
    name                   = aws_lb.myalb.dns_name
    zone_id                = aws_lb.myalb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_instance" "webserver1" {
  ami                    = "ami-03f4878755434977f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.LBSG.id]
  subnet_id              = aws_subnet.subnet1.id
  user_data              = base64encode(file("ud1.sh"))
  tags                   = {
    Name = "Server1"
  }
}

resource "aws_instance" "webserver2" {
  ami                    = "ami-03f4878755434977f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.LBSG.id]
  subnet_id              = aws_subnet.subnet2.id
  user_data              = base64encode(file("ud2.sh"))
  tags                   = {
    Name = "Server2"
  }
}
