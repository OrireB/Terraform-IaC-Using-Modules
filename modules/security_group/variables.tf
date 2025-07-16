variable "security_group_name" {}
variable "vpc_id" {}
variable "security_group_tag" {
  default = "WebSecurityGroup"
}
variable "description" {
  default = "Allow SSH"
}