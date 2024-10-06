resource "aws_s3_bucket_policy" "tfer--my-food-data-bucket" {
  bucket = "my-food-data-bucket"
  policy = "{\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Resource\":\"arn:aws:s3:::my-food-data-bucket/*\"}],\"Version\":\"2012-10-17\"}"
}
