output "domain-name" {
  value = aws_instance.web_server.public_dns
}