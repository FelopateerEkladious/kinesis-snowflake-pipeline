resource "aws_kinesis_stream" "tfer--food-data-stream" {
  arn              = "arn:aws:kinesis:eu-west-2:831926620846:stream/food-data-stream"
  encryption_type  = "NONE"
  name             = "food-data-stream"
  retention_period = "24"
  shard_count      = "0"

  stream_mode_details {
    stream_mode = "ON_DEMAND"
  }
}
