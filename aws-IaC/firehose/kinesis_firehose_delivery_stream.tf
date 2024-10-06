resource "aws_kinesis_firehose_delivery_stream" "tfer--food-data-firehose" {
  arn            = "arn:aws:firehose:eu-west-2:831926620846:deliverystream/food-data-firehose"
  destination    = "extended_s3"
  destination_id = "destinationId-000000000001"

  extended_s3_configuration {
    bucket_arn         = "arn:aws:s3:::my-food-stream-bucket"
    buffering_interval = "300"
    buffering_size     = "5"

    cloudwatch_logging_options {
      enabled         = "true"
      log_group_name  = "/aws/kinesisfirehose/food-data-firehose"
      log_stream_name = "DestinationDelivery"
    }

    compression_format = "UNCOMPRESSED"
    custom_time_zone   = "UTC"
    prefix             = "data/"

    processing_configuration {
      enabled = "true"

      processors {
        parameters {
          parameter_name  = "BufferIntervalInSeconds"
          parameter_value = "900"
        }

        parameters {
          parameter_name  = "BufferSizeInMBs"
          parameter_value = "3"
        }

        parameters {
          parameter_name  = "LambdaArn"
          parameter_value = "arn:aws:lambda:eu-west-2:831926620846:function:my-food-stream-lambda-function:$LATEST"
        }

        type = "Lambda"
      }
    }

    role_arn       = "arn:aws:iam::831926620846:role/service-role/KinesisFirehoseServiceRole-food-data-fir-eu-west-2-1728169057153"
    s3_backup_mode = "Disabled"
  }

  kinesis_source_configuration {
    kinesis_stream_arn = "arn:aws:kinesis:eu-west-2:831926620846:stream/food-data-stream"
    role_arn           = "arn:aws:iam::831926620846:role/service-role/KinesisFirehoseServiceRole-food-data-fir-eu-west-2-1728169057153"
  }

  name = "food-data-firehose"

  server_side_encryption {
    enabled  = "false"
    key_type = "AWS_OWNED_CMK"
  }

  version_id = "2"
}
