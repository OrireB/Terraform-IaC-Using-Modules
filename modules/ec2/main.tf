resource "aws_instance" "my_greatec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group_ids # Later added to the original file

  tags = {
    Name        = var.instance_tag
    Environment = "Dev"
  }
}        