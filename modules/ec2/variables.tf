variable "ami_id" {}
variable "instance_type" {}
variable "instance_tag" {
  default = "MyEC2Instance"
}
variable "security_group_ids" {
  type    = list(string)
  default = []
}