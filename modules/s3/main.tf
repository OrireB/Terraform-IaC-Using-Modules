resource "aws_s3_bucket" "victoriousorirewebspace2025628_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_tag
    Environment = "Dev"
  }
}

