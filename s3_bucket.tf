provider "aws" {
  region = "eu-west-3"  # Paris
}

resource "aws_s3_bucket" "mon_bucket" {
  bucket = "mon-super-bucket-hetic-2025"
  acl    = "private"

  tags = {
    Environment = "dev"
    Project     = "hetic"
  }
}


Ce code va créer un bucket privé S3 appelé mon-super-bucket-hetic-2025.







