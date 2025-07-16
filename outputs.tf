output "ec2_instance_id" {
  value = module.ec2_instance.instance_id
}

output "s3_bucket_id" {
  value = module.s3_bucket.bucket_id
}