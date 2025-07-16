data "aws_vpc" "default" {
  default = true
}

module "ec2_instance" {
  source             = "./modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  instance_tag       = var.instance_tag
  security_group_ids = [module.security_group.security_group_id]
}

module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  bucket_tag  = var.bucket_tag
}

module "security_group" {
  source              = "./modules/security_group"
  security_group_name = "web_sg"
  security_group_tag  = var.security_group_tag
  description         = "Allow SSH"
  vpc_id              = data.aws_vpc.default.id
}
