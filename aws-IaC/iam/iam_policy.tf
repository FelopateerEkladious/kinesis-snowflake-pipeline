resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-aa3b4322-a86f-490c-aa90-f53186d18cad" {
  name = "AWSLambdaBasicExecutionRole-aa3b4322-a86f-490c-aa90-f53186d18cad"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:eu-west-2:831926620846:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:eu-west-2:831926620846:log-group:/aws/lambda/my-food-stream-lambda-function:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--KinesisFirehoseServicePolicy-food-data-firehose-eu-west-2" {
  name = "KinesisFirehoseServicePolicy-food-data-firehose-eu-west-2"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "glue:GetTable",
        "glue:GetTableVersion",
        "glue:GetTableVersions"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:glue:eu-west-2:831926620846:catalog",
        "arn:aws:glue:eu-west-2:831926620846:database/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%",
        "arn:aws:glue:eu-west-2:831926620846:table/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
      ],
      "Sid": ""
    },
    {
      "Action": [
        "kafka:GetBootstrapBrokers",
        "kafka:DescribeCluster",
        "kafka:DescribeClusterV2",
        "kafka-cluster:Connect"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:kafka:eu-west-2:831926620846:cluster/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%",
      "Sid": ""
    },
    {
      "Action": [
        "kafka-cluster:DescribeTopic",
        "kafka-cluster:DescribeTopicDynamicConfiguration",
        "kafka-cluster:ReadData"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:kafka:eu-west-2:831926620846:topic/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%",
      "Sid": ""
    },
    {
      "Action": [
        "kafka-cluster:DescribeGroup"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:kafka:eu-west-2:831926620846:group/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/*",
      "Sid": ""
    },
    {
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:GetBucketLocation",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:ListBucketMultipartUploads",
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::my-food-stream-bucket",
        "arn:aws:s3:::my-food-stream-bucket/*"
      ],
      "Sid": ""
    },
    {
      "Action": [
        "lambda:InvokeFunction",
        "lambda:GetFunctionConfiguration"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:lambda:eu-west-2:831926620846:function:my-food-stream-lambda-function:$LATEST",
      "Sid": ""
    },
    {
      "Action": [
        "kms:GenerateDataKey",
        "kms:Decrypt"
      ],
      "Condition": {
        "StringEquals": {
          "kms:ViaService": "s3.eu-west-2.amazonaws.com"
        },
        "StringLike": {
          "kms:EncryptionContext:aws:s3:arn": [
            "arn:aws:s3:::%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/*",
            "arn:aws:s3:::%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
          ]
        }
      },
      "Effect": "Allow",
      "Resource": [
        "arn:aws:kms:eu-west-2:831926620846:key/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
      ]
    },
    {
      "Action": [
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:eu-west-2:831926620846:log-group:/aws/kinesisfirehose/food-data-firehose:log-stream:*",
        "arn:aws:logs:eu-west-2:831926620846:log-group:%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%:log-stream:*"
      ],
      "Sid": ""
    },
    {
      "Action": [
        "kinesis:DescribeStream",
        "kinesis:GetShardIterator",
        "kinesis:GetRecords",
        "kinesis:ListShards"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:kinesis:eu-west-2:831926620846:stream/food-data-stream",
      "Sid": ""
    },
    {
      "Action": [
        "kms:Decrypt"
      ],
      "Condition": {
        "StringEquals": {
          "kms:ViaService": "kinesis.eu-west-2.amazonaws.com"
        },
        "StringLike": {
          "kms:EncryptionContext:aws:kinesis:arn": "arn:aws:kinesis:eu-west-2:831926620846:stream/food-data-stream"
        }
      },
      "Effect": "Allow",
      "Resource": [
        "arn:aws:kms:eu-west-2:831926620846:key/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}
