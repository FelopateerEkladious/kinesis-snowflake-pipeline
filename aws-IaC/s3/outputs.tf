output "aws_s3_bucket_policy_tfer--my-food-data-bucket_id" {
  value = "${aws_s3_bucket_policy.tfer--my-food-data-bucket.id}"
}

output "aws_s3_bucket_tfer--my-food-data-bucket_id" {
  value = "${aws_s3_bucket.tfer--my-food-data-bucket.id}"
}

output "aws_s3_bucket_tfer--my-food-stream-bucket_id" {
  value = "${aws_s3_bucket.tfer--my-food-stream-bucket.id}"
}
