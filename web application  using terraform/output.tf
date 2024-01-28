output  "public_ip" {
   value = aws_instance.webserver1.public_ip 
}
output  "public_ip2" {
   value = aws_instance.webserver2.public_ip 
}
output "public_dns" {
  value = aws_lb.myalb.dns_name
}

