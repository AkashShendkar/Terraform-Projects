This is First Project on Terraform
In this project,
1) Create VPC
2) Create 2 Public Subnets within VPC
3) Create an Internet Gateway(IGW)
4) Create Route table with IGW attached to it
5) Associated 2 Subnets to route table
6) create security group with inbound traffic coming from port 80
7) Create two ec2 instances in two different subnets
8) Create application load balancer with target group haviung two ec2 instance attached to it.

All this steps are done using terraform(hcl).
