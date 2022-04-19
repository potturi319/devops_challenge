data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
data "template_file" "user_data" {
  template = "${file("bash.sh")}"
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "devops"
  vpc_security_group_ids = [aws_security_group.web-server.id]

  user_data = "${data.template_file.user_data.rendered}"
  tags = {
    Name = "web-server"
  }

}