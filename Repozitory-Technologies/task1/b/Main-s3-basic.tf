terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = "us-west-2"
    access_key = "enter the access key"
    secret_key = "enter the secret key"
}

resource "aws_s3_bucket" "rtechnologies" {
  bucket = "rtechnologies"
  acl    = "private"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "rtechnologies"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

resource "aws_s3_bucket_object" "file" {

  bucket = aws_s3_bucket.rtechnologies.id
  key    = "index.html"
  acl    = "private"
  source = "/path of the directory/index.html"
}
