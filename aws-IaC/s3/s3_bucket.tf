resource "aws_s3_bucket" "tfer--my-food-data-bucket" {
  bucket        = "my-food-data-bucket"
  force_destroy = "false"

  grant {
    id          = "0ebc97cf0a35157f7c8c8bbaf596de07e3128e8e26abb134dca2beb7c4ee7d5a"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Resource": "arn:aws:s3:::my-food-data-bucket/*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  request_payer = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "true"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}

resource "aws_s3_bucket" "tfer--my-food-stream-bucket" {
  bucket        = "my-food-stream-bucket"
  force_destroy = "false"

  grant {
    id          = "0ebc97cf0a35157f7c8c8bbaf596de07e3128e8e26abb134dca2beb7c4ee7d5a"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"
  request_payer       = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "true"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}
