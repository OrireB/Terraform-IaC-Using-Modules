variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-05ffe3c48a9991133"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_tag" {
  default = "MyEC2Instance"
}

variable "bucket_name" {
  default = "victoriousorirewebspace2025628-bucket"
}

variable "bucket_tag" {
  default = "MyS3Bucket"
}

variable "security_group_tag" {
  default = "WebSecurityGroup"
}